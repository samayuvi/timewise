part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthenticationState {}

//states for login page
class AuthenticatedState extends AuthenticationState {
}

class AuthenticatingState extends AuthenticationState {}

class ErrorState extends AuthenticationState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Error { message: $message }';
}


