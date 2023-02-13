import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSource {

  User? get user;

  Future<void> signIn(String email, String password);

  Future<void> signUp(String email, String password);

  Future<void> signOut();
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  User? get user => auth.currentUser;

  @override
  Future<void> signIn(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }
}
