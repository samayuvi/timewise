import 'package:time_wise/core/mappers/mapper.dart';
import 'package:time_wise/app/data/models/board_task_model.dart';
import 'package:time_wise/app/data/models/lap_model.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/entities/lap_entity.dart';

class BoardTaskMapper implements Mapper<BoardTaskModel,BoardTaskEntity>{
  @override
  BoardTaskEntity mapFromModel(BoardTaskModel from) {
    return BoardTaskEntity(
      id: from.id,
      userId: from.userId,
      laps: (from.laps).map((e) => LapEntity(startTime: e.startTime, endTime: e.endTime)).toList(),
      title: from.title,
      creationDate: from.creationDate,
      doneDate: from.doneDate,
      from: from.from,
      columnName:from.columnName,
    );
  }

  @override
  BoardTaskModel mapToModel(BoardTaskEntity to) {
    return BoardTaskModel(
      id: to.id,
      title: to.title,
      laps: (to.laps).map((e) => LapModel(startTime: e.startTime, endTime: e.endTime)).toList(),
      userId: to.userId,
      creationDate: to.creationDate,
      doneDate: to.doneDate,
      from: to.from,
      columnName:to.columnName,
    );
  }
}