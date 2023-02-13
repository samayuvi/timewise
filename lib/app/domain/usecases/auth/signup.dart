import '../../repositories/auth_repository.dart';

class FirebaseAuthSignUp {

  final AuthRepository _authRepository = FirebaseAuthRepositoryImpl();


  Future<void> call(String email, String password) async {
    await _authRepository.signUp(email, password);
  }
}