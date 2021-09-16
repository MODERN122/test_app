part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

class UserSucceed extends UserState {
  final Profile profile;

  UserSucceed(this.profile);
}
