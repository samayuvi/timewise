
import 'package:time_wise/app/domain/entities/board_task.dart';


class BoardListEntity {
  String title;
  List<BoardTaskEntity> items = [];


  BoardListEntity({required this.items, required this.title});
}

