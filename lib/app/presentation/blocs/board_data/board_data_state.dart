part of 'board_data_bloc.dart';

abstract class BoardDataState extends Equatable {
  const BoardDataState();

  @override
  List<Object> get props => [];
}

class BoardDataInitial extends BoardDataState {}

class BoardDataLoading extends BoardDataState {}

class BoardDataLoaded extends BoardDataState {
  final List<BoardListEntity> boardListEntity;

  const BoardDataLoaded({required this.boardListEntity});

  @override
  List<Object> get props => [boardListEntity];
}

class BoardDataError extends BoardDataState {
  final String message;

  const BoardDataError({required this.message});

  @override
  List<Object> get props => [message];
}

class BoardDataExported extends BoardDataState {
}

class BoardDataExportError extends BoardDataState {

}


