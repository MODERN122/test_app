part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucceed extends AuthState {}

class Authorization extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
