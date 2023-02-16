import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_wise/app/domain/usecases/auth/signin.dart';
import 'package:bloc/bloc.dart';
import 'package:time_wise/app/domain/usecases/auth/signout.dart';
import 'package:time_wise/app/domain/usecases/auth/signup.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{

  final FirebaseAuthSignIn signIn = FirebaseAuthSignIn();
  final FirebaseAuthSignUp signUp = FirebaseAuthSignUp();
  final FirebaseSignOut signout = FirebaseSignOut();

  String email = "";
  String password = "";

  AuthenticationBloc() : super(Unauthenticated()){
  on<LoginEvent>((event, emit) async{
    AuthenticationState authenticationState = await login(email, password);
    emit(authenticationState);
  });
  on<SignUpEvent>((event, emit) async{
    AuthenticationState authenticationState = await register(email, password);
    emit(authenticationState);

  });
  on<LogoutEvent>((event, emit) async{
    AuthenticationState authenticationState = await logout();
    emit(authenticationState);
  });
  on<UpdateEmailEvent>((event, emit) async{
    email = event.email;
  });
  on<UpdatePasswordEvent>((event, emit) async{
    password = event.password;
  });

}

  Future<AuthenticationState> login(String email, String password) async{
    try {
      await signIn(email, password);
    } on FirebaseAuthException catch (e) {
      return ErrorState(e.message!);
    }
    return AuthenticatedState();
  }

  Future<AuthenticationState> register(String email, String password) async{
      try {
        await signUp(email, password);
        await signIn(email, password);
      } on FirebaseAuthException catch (e) {
        return ErrorState(e.message!);
      }

      return AuthenticatedState();
  }

  Future<AuthenticationState> logout() async{
    try {
      await signout();
    } on FirebaseAuthException catch (e) {
      return ErrorState(e.message!);
    }
    return Unauthenticated();
  }
}