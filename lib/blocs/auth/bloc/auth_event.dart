part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SendAuth extends AuthEvent {
  final String userName;
  final String password;

  SendAuth(this.userName, this.password);
}

class CheckAuth extends AuthEvent {}
