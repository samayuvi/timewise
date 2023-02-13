import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_wise/app/data/datasources/firebase_auth_data_source.dart';


abstract class AuthRepository {
  Future<void> signIn(String email, String password);

  Future<void> signUp(String email, String password);

  Future<void> signOut();

  User? get user;
}

class FirebaseAuthRepositoryImpl implements AuthRepository{

  final FirebaseAuthDataSource authDataSource = FirebaseAuthDataSourceImpl();

  FirebaseAuthRepositoryImpl();

  @override
  Future<void> signIn(String email, String password) async {
    await authDataSource.signIn(email, password);
  }
  @override
  Future<void> signUp(String email, String password) async {
    await authDataSource.signUp(email, password);
  }
  @override
  Future<void> signOut() async {
    await authDataSource.signOut();
  }
  @override
  User? get user => authDataSource.user;

}