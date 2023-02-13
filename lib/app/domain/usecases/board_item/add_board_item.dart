import '../../entities/board_task.dart';
import '../../repositories/board_item_repository.dart';

class AddBoardItem{
  final BoardItemRepository boardItemRepository = FirebaseBoardItemRepositoryImpl();

  AddBoardItem();

  Future<void> call(BoardTaskEntity boardItem) async {
    await boardItemRepository.addBoardItem(boardItem);
  }
}