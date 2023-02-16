part of 'board_data_bloc.dart';

abstract class BoardDataEvent extends Equatable {
  const BoardDataEvent();

  @override
  List<Object> get props => [];
}

class GetBoardDataEvent extends BoardDataEvent {}

class UpdateBoardItemEvent extends BoardDataEvent {
  final BoardTaskEntity boardTaskEntity;

  const UpdateBoardItemEvent({required this.boardTaskEntity});

  @override
  List<Object> get props => [boardTaskEntity];
}

class DeleteBoardItemEvent extends BoardDataEvent {
  final BoardTaskEntity boardTaskEntity;

  const DeleteBoardItemEvent({required this.boardTaskEntity});

  @override
  List<Object> get props => [boardTaskEntity];
}

class AddBoardItemEvent extends BoardDataEvent {
  final BoardTaskEntity boardTaskEntity;
  final String columnName;

  const AddBoardItemEvent({required this.columnName, required this.boardTaskEntity});

  @override
  List<Object> get props => [boardTaskEntity];
}

class UpdateBoardItemStatusEvent extends BoardDataEvent {
  final BoardTaskEntity boardTaskEntity;
  final String columnName;

  const UpdateBoardItemStatusEvent({required this.boardTaskEntity, required this.columnName});

  @override
  List<Object> get props => [boardTaskEntity];
}

class ExportToCSVEvent extends BoardDataEvent {

}
