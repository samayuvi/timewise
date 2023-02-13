import 'package:time_wise/app/data/models/board_task_model.dart';
import 'package:time_wise/app/domain/entities/lap_entity.dart';

class BoardTaskEntity{
  String id;
  String columnName;
  String userId;
  String title;
  DateTime creationDate;
  DateTime? doneDate;
  String from;

  List<LapEntity> laps = [];

  BoardTaskEntity({this.title = "", this.columnName = MainColumnNames.todo, required this.creationDate, this.doneDate, this.from = "", this.laps = const [], this.id = "", this.userId = ""});

  copyWith ({String? title, String? columnName, DateTime? creationDate, DateTime? doneDate, String? from, List<LapEntity>? laps, String? id, String? userId}) {
    return BoardTaskEntity(
      title: title ?? this.title,
      columnName: columnName ?? this.columnName,
      creationDate: creationDate ?? this.creationDate,
      doneDate: doneDate ?? this.doneDate,
      from: from ?? this.from,
      laps: laps ?? this.laps,
      id: id ?? this.id,
      userId: userId ?? this.userId,
    );
  }
}

