import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/repositories/board_item_repository.dart';

class GetBoardItems {
  final BoardItemRepository repository = FirebaseBoardItemRepositoryImpl();

  GetBoardItems();

  Future<List<BoardTaskEntity>> call() async {
    return await repository.getBoardItems();
  }
}