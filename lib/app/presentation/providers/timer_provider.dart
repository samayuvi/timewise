import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/usecases/board_item/update_board_item.dart';
import 'dart:async';

import '../../domain/entities/lap_entity.dart';

class TimerService extends ChangeNotifier {
  UpdateBoardItem updateBoardItem = UpdateBoardItem();
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  String digitSeconds = "00";
  String digitMinutes = "00";
  String digitHours = "00";
  Timer? timer;
  bool started = false;
  bool loading = false;
  BoardTaskEntity boardTaskEntity;

  TimerService({required this.boardTaskEntity}) {
    init();
  }

  init() {
    calculateTotalTime();
    if (boardTaskEntity.laps.isNotEmpty &&
        boardTaskEntity.laps.last.endTime == null) startTimer();
  }

  Future<void> stopTimer() async {
    boardTaskEntity.laps.last.endTime = DateTime.now();
    loading = true;
    updateBoardItem(boardTaskEntity);
    loading = false;
    timer?.cancel();
    started = false;
    calculateTotalTime();
    notifyListeners();
  }

  void calculateTotalTime() {
    int totalSeconds = 0;
    if (boardTaskEntity.laps.isEmpty) return;
    for (var lap in boardTaskEntity.laps) {
      if (lap.endTime == null) {
        totalSeconds += DateTime.now().difference(lap.startTime).inSeconds;
        continue;
      }
      int lapSeconds = lap.endTime!.difference(lap.startTime).inSeconds;
      totalSeconds += lapSeconds;
    }

    hours = totalSeconds ~/ 3600;
    minutes = (totalSeconds % 3600) ~/ 60;
    seconds = (totalSeconds % 3600) % 60;

    digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
    digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
    digitHours = (hours >= 10) ? "$hours" : "0$hours";
  }

  void resetTimer() {
    timer?.cancel();
    started = false;
    seconds = 0;
    minutes = 0;
    hours = 0;
    digitSeconds = "00";
    digitMinutes = "00";
    digitHours = "00";
    boardTaskEntity.laps = [];
    updateBoardItem(boardTaskEntity);
    notifyListeners();
  }

  Future<void> startTimer() async {
    started = true;
    if (boardTaskEntity.laps.isEmpty ||
        boardTaskEntity.laps.last.endTime != null) {
      boardTaskEntity.laps.add(LapEntity(startTime: DateTime.now()));
    }
    updateBoardItem(boardTaskEntity);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        localSeconds = 0;
        localMinutes++;
        if (localMinutes > 59) {
          localMinutes = 0;
          localHours++;
        }
      }

      seconds = localSeconds;
      minutes = localMinutes;
      hours = localHours;

      digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
      digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
      digitHours = (hours >= 10) ? "$hours" : "0$hours";

      notifyListeners();
    });}}
