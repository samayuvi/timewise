import '../../repositories/auth_repository.dart';

class FirebaseSignOut {
  final AuthRepository _authRepository = FirebaseAuthRepositoryImpl();

  FirebaseSignOut();

  Future<void> call() async {
    await _authRepository.signOut();
  }
}

