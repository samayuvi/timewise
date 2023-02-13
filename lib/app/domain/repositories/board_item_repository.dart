import 'package:time_wise/app/data/datasources/board_task_data_source.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';

abstract class BoardItemRepository {
  Future<List<BoardTaskEntity>> getBoardItems();
  Future<void> addBoardItem(BoardTaskEntity boardItem);
  Future<void> updateBoardItem(BoardTaskEntity boardItem);
  Future<void> deleteBoardItem(BoardTaskEntity boardItem);
}

class FirebaseBoardItemRepositoryImpl implements BoardItemRepository {
  final BoardItemDataSource dataSource = FirebaseBoardItemDataSourceImpl();


  @override
  Future<List<BoardTaskEntity>> getBoardItems() async {
    return await dataSource.getBoardItems();
  }

  @override
  Future<void> addBoardItem(BoardTaskEntity boardItem) async {
    await dataSource.addBoardItem(boardItem);
  }

  @override
  Future<void> updateBoardItem(BoardTaskEntity boardItem) async {
    await dataSource.updateBoardItem(boardItem);
  }

  @override
  Future<void> deleteBoardItem(BoardTaskEntity boardItem) async {
    await dataSource.deleteBoardItem(boardItem);
  }
}