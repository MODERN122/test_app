part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainError extends MainState {
  final String message;

  MainError(this.message);
}

class GetFolderSucceed extends MainState {
  final FolderFull folder;
  final String title;

  GetFolderSucceed(this.folder, this.title);
}