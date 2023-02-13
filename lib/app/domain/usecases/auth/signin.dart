
import '../../repositories/auth_repository.dart';

class FirebaseAuthSignIn {
  final AuthRepository _authRepository = FirebaseAuthRepositoryImpl();

  FirebaseAuthSignIn();

  Future<void> call(String email, String password) async {
    await _authRepository.signIn(email, password);
  }
}