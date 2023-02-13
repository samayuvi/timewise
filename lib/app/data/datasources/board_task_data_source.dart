import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_wise/core/mappers/mapper.dart';
import 'package:time_wise/app/data/mapper/board_task_mapper.dart';
import 'package:time_wise/app/domain/entities/board_task.dart';

import '../models/board_task_model.dart';

abstract class BoardItemDataSource {
  Future<List<BoardTaskEntity>> getBoardItems();

  Future<void> addBoardItem(BoardTaskEntity boardItem);

  Future<void> updateBoardItem(BoardTaskEntity boardItem);

  Future<void> deleteBoardItem(BoardTaskEntity boardItem);
}

class FirebaseBoardItemDataSourceImpl implements BoardItemDataSource {
  late FirebaseFirestore db;
  late FirebaseAuth auth;
  final Mapper mapper = BoardTaskMapper();

  FirebaseBoardItemDataSourceImpl({FirebaseFirestore? db, FirebaseAuth? auth}){
    if(auth != null){
      this.auth = auth;
    }else{
      this.auth = FirebaseAuth.instance;
    }
    if(db != null){
       this.db = db;
    }else{
      this.db = FirebaseFirestore.instance;
    }
  }

  @override
  Future<List<BoardTaskEntity>> getBoardItems() async {
    List<BoardTaskEntity> boardItems = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('boardItems').where("userId", isEqualTo: auth.currentUser!.uid).get();
    for (var doc in querySnapshot.docs) {
      BoardTaskModel boardTaskModel = BoardTaskModel.fromMap(doc.data());
      boardTaskModel.id = doc.id;
      boardTaskModel.userId = auth.currentUser!.uid;
      boardItems.add(mapper.mapFromModel(boardTaskModel));
    }
    return boardItems;
  }

  @override
  Future<void> addBoardItem(BoardTaskEntity boardItem) async {
    BoardTaskModel boardTaskModel = mapper.mapToModel(boardItem);
    boardTaskModel.userId = auth.currentUser!.uid;
    await db.collection('boardItems').add(boardTaskModel.toMap());
  }

  @override
  Future<void> updateBoardItem(BoardTaskEntity boardItem) async {
    BoardTaskModel boardTaskModel = mapper.mapToModel(boardItem);
    await db
        .collection('boardItems')
        .doc(boardItem.id)
        .update(boardTaskModel.toMap());
  }

  @override
  Future<void> deleteBoardItem(BoardTaskEntity boardItem) async {
    BoardTaskModel boardTaskModel = mapper.mapToModel(boardItem);
    await db.collection('boardItems').doc(boardTaskModel.id).delete();
  }
}
