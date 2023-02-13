import 'package:boardview/board_item.dart';
import 'package:boardview/board_list.dart';
import 'package:boardview/boardview.dart';
import 'package:boardview/boardview_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_wise/main.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/entities/board_list_entity.dart';
import 'package:time_wise/app/presentation/pages/home/components/board_list_header.dart';
import 'package:time_wise/app/presentation/pages/timer_widget/timer_widget.dart';
import 'package:time_wise/app/presentation/providers/timer_provider.dart';

import '../../../providers/board_data_provider.dart';
import 'board_item.dart';

class BoardViewExample extends StatelessWidget {
  //Can be used to animate to different sections of the BoardView
  final BoardViewController boardViewController = BoardViewController();
  BoardViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BoardListEntity> listData =
        context.select((BoardDataService service) {
      return service.listData;
    });

    return Consumer<BoardDataService>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: BoardView(
            lists: listData
                .map((list) => _createBoardList(list, listData, context))
                .toList(),
            boardViewController: boardViewController,
          ),
        );
      },
    );
  }

  void _showTimerModalBottomSheet(BuildContext context, BoardTaskEntity item){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ChangeNotifierProvider<TimerService>(
          create: (BuildContext context) => TimerService(boardTaskEntity: item),
          child: const TimerWidget());
      },
    );
  }

  BoardItem _buildBoardItem(
      BoardTaskEntity itemObject, List<BoardListEntity> listData, BuildContext context) {
    return BoardItem(
        onDropItem: (int? listIndex, int? itemIndex, int? oldListIndex,
            int? oldItemIndex, BoardItemState state) async{
          //Used to update our local item data
          var item = listData[oldListIndex!].items[oldItemIndex!];
          listData[oldListIndex].items.removeAt(oldItemIndex);
          item.columnName = listData[listIndex!].title;
          listData[listIndex].items.insert(itemIndex!, item);
          await context.read<BoardDataService>().updateBoardItemStatus(item, listData[oldListIndex].title);
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
      items.insert(i, _buildBoardItem(list.items[i], listData,context));
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
