import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/board_task_model.dart';
import '../../../domain/entities/board_list_entity.dart';
import '../../../domain/entities/board_task.dart';
import '../../../domain/usecases/board_item/add_board_item.dart';
import '../../../domain/usecases/board_item/delete_board_item.dart';
import '../../../domain/usecases/board_item/get_board_items.dart';
import '../../../domain/usecases/board_item/update_board_item.dart';
import '../../../domain/usecases/share_csv.dart';

part 'board_data_event.dart';
part 'board_data_state.dart';

class BoardDataBloc extends Bloc<BoardDataEvent, BoardDataState> {

  List<BoardListEntity> _listData = [];

  GetBoardItems getBoardItemsUseCase = GetBoardItems();
  AddBoardItem addBoardItemUseCase = AddBoardItem();
  UpdateBoardItem updateBoardItemUseCase = UpdateBoardItem();
  DeleteBoardItem deleteBoardItemUseCase = DeleteBoardItem();



  List<BoardListEntity> get listData => _listData;

  BoardDataBloc() : super(BoardDataInitial()){
    on<GetBoardDataEvent>((event, emit) async{
      emit(BoardDataLoading());
      try{
        BoardDataState boardDataState = await getBoardItems();
        emit(boardDataState);
      } on Exception catch(e){
        emit(BoardDataError(message: e.toString()));
      }
    });
    on<UpdateBoardItemEvent>((event, emit) async{
      emit(BoardDataLoading());
      try{
        BoardDataState boardDataState = await updateBoardItem(event.boardTaskEntity);
        emit(boardDataState);
      } on Exception catch(e){
        emit(BoardDataError(message: e.toString()));
      }
    });
    on<AddBoardItemEvent>((event, emit) async{
      emit(BoardDataLoading());
      try{
        await addItem(event.columnName, event.boardTaskEntity);
        emit(await getBoardItems());
      } on Exception catch(e){
        emit(BoardDataError(message: e.toString()));
      }
    });
    on<UpdateBoardItemStatusEvent>((event, emit) async{
     await updateBoardItemStatus(event.boardTaskEntity);
    });
    on<ExportToCSVEvent>((event, emit) async{
      await exportToCSV();
    });
  }

  Future<BoardDataState> getBoardItems() async {
    List<BoardTaskEntity> boardItems = await getBoardItemsUseCase();
    _listData = [
      BoardListEntity(
          title: MainColumnNames.todo,
          items: boardItems
              .where((element) => element.columnName == MainColumnNames.todo)
              .toList()),
      BoardListEntity(
          title: MainColumnNames.doing,
          items: boardItems
              .where((element) => element.columnName == MainColumnNames.doing)
              .toList()),
      BoardListEntity(
          title: MainColumnNames.done,
          items: boardItems
              .where((element) => element.columnName == MainColumnNames.done)
              .toList()),
    ];
    return BoardDataLoaded(boardListEntity: _listData);
  }

  //export to csv
  Future<void> exportToCSV() async {
    ShareCSV shareCSV = ShareCSV();
    await shareCSV(_listData);
  }

  Future<void> updateBoardItemStatus(
      BoardTaskEntity item) async {


      if (item.columnName == MainColumnNames.done) {
        item.doneDate = DateTime.now();
      } else{
        item.doneDate = null;
      }
      await updateBoardItemUseCase(item);

  }

  Future<BoardDataState> updateBoardItem(BoardTaskEntity item) async {
    await updateBoardItemUseCase(item);
    return await getBoardItems();
  }

  Future<void> addItem(String listTitle, BoardTaskEntity item) async {
    int index = _listData.indexWhere((element) {
      return element.title == listTitle;
    });

    if (index != -1) {
      await addBoardItemUseCase(item);
      await getBoardItems();
    }
  }
}





