
import 'package:time_wise/app/data/models/lap_model.dart';

abstract class MainColumnNames {
  static const todo = 'To Do';
  static const doing = 'Doing';
  static const done = 'Done';
}


class BoardTaskModel{
  String id;
  String columnName;
  String userId;
  String title;
  DateTime creationDate;
  DateTime? doneDate;
  String from;
  int columnPositionIndex;

  List<LapModel> laps = [];

  BoardTaskModel({this.title = "", this.columnName = MainColumnNames.todo, required this.creationDate, this.doneDate, this.from = "", this.laps = const [], this.id = "", this.userId = "", this.columnPositionIndex = 0});

  static BoardTaskModel fromMap(Map<String, dynamic> data) {
    return BoardTaskModel(
      id: "",
      columnName: data['columnName'],
      userId: data['userId'],
      creationDate: DateTime.parse(data['creationDate']),
      doneDate: DateTime.tryParse(data['doneDate']??""),
      title: data['title'],
      from: data['from'],
      laps: data['laps'].map<LapModel>((e) => LapModel.fromMap(e)).toList(),
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'columnName': columnName,
      'userId': userId,
      'title': title,
      'creationDate': creationDate.toIso8601String(),
      'doneDate': doneDate?.toIso8601String(),
      'from': from,
      'laps': laps.map((e) => e.toMap()).toList(),
    };
  }
}