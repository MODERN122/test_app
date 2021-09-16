part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class GetFolderById extends MainEvent {
  final int folderId;
  final String? userId;
  final FilterType? filterType;
  GetFolderById(this.folderId, {this.userId, this.filterType});
}

class GetMyDocuments extends MainEvent {
  final String? userId;
  final FilterType? filterType;
  GetMyDocuments({this.userId, this.filterType});
}

class GetCommonDocumets extends MainEvent {
  final String? userId;
  final FilterType? filterType;
  GetCommonDocumets({this.userId, this.filterType});
}
