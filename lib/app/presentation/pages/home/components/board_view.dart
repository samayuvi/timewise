import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_wise/app/domain/factories/screen_factory.dart';
import 'package:time_wise/main.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/entities/board_list_entity.dart';
import 'package:time_wise/app/presentation/pages/home/components/board_list_header.dart';

import '../../../blocs/board_data/board_data_bloc.dart';
import 'board_item.dart';

class BoardViewExample extends StatelessWidget {
  //Can be used to animate to different sections of the BoardView
  final BoardViewController boardViewController = BoardViewController();

  BoardViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardDataBloc, BoardDataState>(
        builder: (context, state) {
      if (state is BoardDataLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is BoardDataError) {
        return Center(
          child: Text(state.message),
        );
      }
      if (state is BoardDataLoaded) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: BoardView(
            lists: state.boardListEntity
                .map((list) =>
                    _createBoardList(list, state.boardListEntity, context))
                .toList(),
            boardViewController: boardViewController,
          ),
        );
      }
      if (state is BoardDataInitial) {
        context.read<BoardDataBloc>().add(GetBoardDataEvent());
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  void _showTimerModalBottomSheet(BuildContext context, BoardTaskEntity item) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ScreenFactory().makeTimerWidget(boardTaskEntity: item);
      },
    );
  }

  BoardItem _buildBoardItem(BoardTaskEntity itemObject,
      List<BoardListEntity> listData, BuildContext context) {
    return BoardItem(
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState state) async {
          //Used to update our local item data
          var item = listData[oldListIndex!].items[oldItemIndex!];
          listData[oldListIndex].items.removeAt(oldItemIndex);
          item.columnName = listData[listIndex!].title;
          listData[listIndex].items.insert(itemIndex!, item);
          context.read<BoardDataBloc>().add(UpdateBoardItemStatusEvent(
              columnName: listData[listIndex].title, boardTaskEntity: item));
        },
        onTapItem:
            (int? listIndex, int? itemIndex, BoardItemState state) async {
          _showTimerModalBottomSheet(navigatorKey.currentContext!, itemObject);
        },
        item: BoardItemCard(
          itemObject: itemObject,
        ));
  }

  BoardList _createBoardList(
      BoardListEntity list, List<BoardListEntity> listData, context) {
    List<BoardItem> items = [];

    for (int i = 0; i < list.items.length; i++) {
      items.insert(i, _buildBoardItem(list.items[i], listData, context));
    }

    return BoardList(
      draggable: false,
      onStartDragList: (int? listIndex) {},
      onTapList: (int? listIndex) async {},
      onDropList: (int? listIndex, int? oldListIndex) {
        //Update our local list data
        var list = listData[oldListIndex!];
        listData.removeAt(oldListIndex);
        listData.insert(listIndex!, list);
      },
      headerBackgroundColor: Theme.of(context).colorScheme.background,
      backgroundColor: Theme.of(context).colorScheme.background,
      header: [
        BoardListHeader(
          list: list,
        )
      ],
      items: items,
    );
  }
}
