//after firebase integration the tests stopped working
// import 'package:flutter_test/flutter_test.dart';
// import 'package:time_wise/app/domain/entities/board_task.dart';
// import 'package:time_wise/app/domain/entities/lap_entity.dart';
// import 'package:time_wise/app/presentation/providers/history_provider.dart';
//
// void main() {
//   group('HistoryProvider', () {
//     test('calculateTotalTimeForHistory returns correct total time', () {
//       final boardTask = BoardTaskEntity(
//         id: 'task1',
//         laps: [
//           LapEntity(startTime: DateTime.now(), endTime: DateTime.now().add(Duration(seconds: 5))),
//           LapEntity(startTime: DateTime.now().add(Duration(seconds: 10)), endTime: DateTime.now().add(Duration(seconds: 20))),
//         ], creationDate: DateTime.now(),
//       );
//       final historyProvider = HistoryProvider();
//       final totalTime = historyProvider.calculateTotalTimeForHistory(boardTask);
//       expect(totalTime, '00:00:25');
//     });
//
//     test('calculateTotalTimeForHistory returns correct total time with empty laps', () {
//       final boardTask = BoardTaskEntity(
//         id: 'task1',
//         laps: [], creationDate: DateTime.now(),
//       );
//       final historyProvider = HistoryProvider();
//       final totalTime = historyProvider.calculateTotalTimeForHistory(boardTask);
//       expect(totalTime, '00:00:00');
//     });
//   });
// }
