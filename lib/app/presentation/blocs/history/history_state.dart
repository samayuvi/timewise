part of 'history_bloc.dart';


abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<BoardTaskEntity> boardItems;

  const HistoryLoaded(this.boardItems);

  @override
  List<Object> get props => [boardItems];
}

class HistoryError extends HistoryState {
  final String message;

  const HistoryError(this.message);
}
