import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/repositories/board_item_repository.dart';

class DeleteBoardItem {
  final BoardItemRepository repository = FirebaseBoardItemRepositoryImpl();

  DeleteBoardItem();

  Future<void> call(BoardTaskEntity boardItem) async {
    return repository.deleteBoardItem(boardItem);
  }
}