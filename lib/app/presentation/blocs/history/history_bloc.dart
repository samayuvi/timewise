import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';
import 'package:time_wise/app/domain/repositories/board_item_repository.dart';

import '../../../data/models/board_task_model.dart';

part 'history_state.dart';
part 'history_event.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {


  final BoardItemRepository repository = FirebaseBoardItemRepositoryImpl();

  List<BoardTaskEntity> history = [];
  List<BoardTaskEntity> currentTasks = [];

  HistoryBloc() : super(HistoryInitial()){
    on<HistoryInitialEvent>((event, emit) async{
      emit(HistoryLoading());
      try{
        history = await repository.getBoardItems();
        emit(HistoryLoaded(history));
      } on Exception catch(e){
        emit(HistoryError(e.toString()));
      }
    });
    on<HistoryLoadEvent>((event, emit) async{
      emit(HistoryLoading());
      try{
        filterType = event.filterType;
        emit(HistoryLoaded(currentTasks));
      } on Exception catch(e){
        emit(HistoryError(e.toString()));
      }
    });
  }

  set filterType(FilterType value) {
    if(value == FilterType.all){
      currentTasks = history;
    }else if(value == FilterType.done){
      currentTasks = doneTasks;
    }else if(value == FilterType.undone){
      currentTasks = undoneTasks;
    }
    else if(value == FilterType.doing){
      currentTasks = doingTasks;
    }
    else if(value == FilterType.todo){
      currentTasks = todoTasks;
    }
  }
  //get all tasks
  List<BoardTaskEntity> get allTasks => history
      .where((element) => element.columnName == MainColumnNames.done)
      .toList();

  //get only done tasks
  List<BoardTaskEntity> get doneTasks => history
      .where((element) => element.columnName == MainColumnNames.done)
      .toList();

  //get only undone tasks
  List<BoardTaskEntity> get undoneTasks => history
      .where((element) => element.columnName != MainColumnNames.done)
      .toList();

  //get only doing tasks
  get doingTasks => history
      .where((element) => element.columnName == MainColumnNames.doing)
      .toList();

  //get only to do tasks
  List<BoardTaskEntity> get todoTasks => history
      .where((element) => element.columnName == MainColumnNames.todo)
      .toList();


  String calculateTotalTimeForHistory(BoardTaskEntity boardTaskEntity) {
    int totalSeconds = 0;
    if (boardTaskEntity.laps.isEmpty) return "00:00:00";
    for (var lap in boardTaskEntity.laps) {
      if (lap.endTime == null) {
        totalSeconds += DateTime.now().difference(lap.startTime).inSeconds;
        continue;
      }
      int lapSeconds = lap.endTime!.difference(lap.startTime).inSeconds;
      totalSeconds += lapSeconds;
    }

    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = (totalSeconds % 3600) % 60;

    String digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
    String digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
    String digitHours = (hours >= 10) ? "$hours" : "0$hours";

    return "$digitHours:$digitMinutes:$digitSeconds";
  }


}