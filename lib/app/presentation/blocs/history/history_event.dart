part of 'history_bloc.dart';

enum FilterType { all, done, undone, doing, todo }

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class HistoryInitialEvent extends HistoryEvent {}

class HistoryLoadEvent extends HistoryEvent {
  final FilterType filterType;

  const HistoryLoadEvent(this.filterType);

  @override
  List<Object> get props => [filterType];
}


