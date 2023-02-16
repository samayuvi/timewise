part of 'authentication_bloc.dart';
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

//login event
class LoginEvent extends AuthenticationEvent {

}

class UpdateEmailEvent extends AuthenticationEvent {
  final String email;

  const UpdateEmailEvent({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'UpdateEmail { email: $email }';
}

class UpdatePasswordEvent extends AuthenticationEvent {
  final String password;

  const UpdatePasswordEvent({required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'UpdatePassword { password: $password }';
}

//sign up event
class SignUpEvent extends AuthenticationEvent{
}

//logout
class LogoutEvent extends AuthenticationEvent{}



