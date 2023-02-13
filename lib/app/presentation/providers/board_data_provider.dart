import 'package:flutter/material.dart';

import 'package:time_wise/app/data/models/board_task_model.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/usecases/board_item/get_board_items.dart';
import 'package:time_wise/app/domain/usecases/board_item/update_board_item.dart';
import 'package:time_wise/app/domain/entities/board_list_entity.dart';
import 'package:time_wise/app/domain/usecases/share_csv.dart';

import '../../domain/usecases/board_item/add_board_item.dart';
import '../../domain/usecases/board_item/delete_board_item.dart';

class BoardDataService with ChangeNotifier {
  List<BoardListEntity> _listData = [];

  GetBoardItems getBoardItemsUseCase = GetBoardItems();
  AddBoardItem addBoardItemUseCase = AddBoardItem();
  UpdateBoardItem updateBoardItemUseCase = UpdateBoardItem();
  DeleteBoardItem deleteBoardItemUseCase = DeleteBoardItem();

  bool loading = false;

  List<BoardListEntity> get listData => _listData;

  BoardDataService() {
    init();
  }

  init() async {
    await getBoardItems();
  }

  Future<void> getBoardItems() async {
    loading = true;
    List<BoardTaskEntity> boardItems = await getBoardItemsUseCase();
    _listData = [
      BoardListEntity(
          title: MainColumnNames.todo,
          items: boardItems
              .where((element) => element.columnName == MainColumnNames.todo)
              .toList()),
      BoardListEntity(
          title: MainColumnNames.doing,
          items: boardItems
              .where((element) => element.columnName == MainColumnNames.doing)
              .toList()),
      BoardListEntity(
          title: MainColumnNames.done,
          items: boardItems
              .where((element) => element.columnName == MainColumnNames.done)
              .toList()),
    ];
    loading = false;
    notifyListeners();
  }

  //export to csv
  Future<void> exportToCSV() async {
    ShareCSV shareCSV = ShareCSV();
    await shareCSV(_listData);
  }

  Future<void> updateBoardItemStatus(
      BoardTaskEntity item, String listTitle) async {
    if (item.columnName != listTitle) {
      if (item.columnName == MainColumnNames.done) {
        item.doneDate = DateTime.now();
      } else{
        item.doneDate = null;
      }
      await updateBoardItemUseCase(item);
    }
  }

  Future<void> updateBoardItem(BoardTaskEntity item) async {
    await updateBoardItemUseCase(item);
    await getBoardItems();
    notifyListeners();
  }

  Future<void> deleteBoardItem(BoardTaskEntity item) async {
    await deleteBoardItem(item);
    await getBoardItems();
    notifyListeners();
  }

  Future<void> addItem(String listTitle, BoardTaskEntity item) async {
    int index = _listData.indexWhere((element) {
      return element.title == listTitle;
    });

    if (index != -1) {
      print(item.title);
      await addBoardItemUseCase(item);
      await getBoardItems();
      notifyListeners();
    }
  }
}
