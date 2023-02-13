
class LapModel{
  DateTime startTime;
  DateTime? endTime;

  LapModel({required this.startTime, this.endTime});

  factory LapModel.fromMap(Map<String, dynamic> json) {

    return LapModel(
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.tryParse(json['endTime']??""),
    );
  }

  Map<String, dynamic> toMap() => {
    'startTime': startTime.toIso8601String(),
    'endTime': endTime?.toIso8601String(),
  };
}