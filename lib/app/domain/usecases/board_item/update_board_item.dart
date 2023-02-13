import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/repositories/board_item_repository.dart';

class UpdateBoardItem{
  final BoardItemRepository repository = FirebaseBoardItemRepositoryImpl();

  UpdateBoardItem();

  Future<void> call(BoardTaskEntity boardItem) async {
    return repository.updateBoardItem(boardItem);
  }
}