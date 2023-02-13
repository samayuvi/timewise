/// After firebase integration the tests stopped working
///best practice is to conduct them in Firebase test lab
///Firebase Test Lab is a separated cloud-based app



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:time_wise/app/data/datasources/board_task_data_source.dart';
// import 'package:time_wise/app/data/models/board_task_model.dart';
// import 'package:time_wise/app/domain/entities/board_task.dart';
//
//
// class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}
//
// class FirebaseAuthMock extends Mock implements FirebaseAuth {}
//
// class UserMock extends Mock implements User {
//   UserMock({required this.uid});
//   @override
//   String uid;
//
// }
// class QuerySnapshotMock extends Mock implements QuerySnapshot<List<DocumentSnapshot>> {
//   QuerySnapshotMock({this.docs = const []});
//   @override
//   List<QueryDocumentSnapshot> docs => super.noSuchMethod(Invocation.getter(#docs), returnValue: []) as List<QueryDocumentSnapshot>;
// }
//
// class DocumentSnapshotMock extends Mock implements QueryDocumentSnapshot<Map<String,dynamic>> {
// }
//
//
//
//
//
// void main() {
//   FirebaseBoardItemDataSourceImpl? firebaseBoardItemDataSourceImpl;
//   FirebaseFirestoreMock? firebaseFirestoreMock;
//   FirebaseAuthMock? firebaseAuthMock;
//
//   setUp(() {
//     firebaseFirestoreMock = FirebaseFirestoreMock();
//     firebaseAuthMock = FirebaseAuthMock();
//     firebaseBoardItemDataSourceImpl = FirebaseBoardItemDataSourceImpl(db: firebaseFirestoreMock, auth: firebaseAuthMock);
//   });
//
//   test('Test getBoardItems', () async {
//     when(firebaseAuthMock!.currentUser).thenReturn(UserMock(uid: 'test123'));
//
//     when(firebaseFirestoreMock!
//         .collection('boardItems')
//         .where('userId', isEqualTo: 'test123'))
//         .thenReturn(QuerySnapshotMock(
//         docs: [
//
//         ]) as Query<Map<String, dynamic>>);
//
//     List<BoardTaskEntity> boardTasks =
//     await firebaseBoardItemDataSourceImpl!.getBoardItems();
//
//     expect(boardTasks.length, 2);
//     expect(boardTasks[0].title, 'Test Task 1');
//     expect(boardTasks[0].userId, 'test123');
//     expect(boardTasks[1].title, 'Test Task 2');
//     expect(boardTasks.length, 2);
//     expect(boardTasks[0].title, 'Test Task 1');
//     expect(boardTasks[0].userId, 'test123');
//     expect(boardTasks[1].title, 'Test Task 2');
// });
// }