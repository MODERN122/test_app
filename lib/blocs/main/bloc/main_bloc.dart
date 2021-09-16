import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/models/filter_type.dart';
import 'package:test_app/models/folder.dart';
import 'package:test_app/repositories/document_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required this.documentRepository}) : super(MainInitial());
  DocumentRepository documentRepository;
  FolderFull? myDocuments;
  FolderFull? commonDocuments;

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is GetMyDocuments) {
      try {
        yield MainLoading();
        myDocuments = await documentRepository.getMyDocuments();
        yield GetFolderSucceed(myDocuments!, "My Documents");
      } on Exception catch (e) {
        yield MainError(e.toString());
      }
    } else if (event is GetCommonDocumets) {
      try {
        yield MainLoading();
        myDocuments = await documentRepository.getCommonDocuments();
        yield GetFolderSucceed(commonDocuments!, "Common Documents");
      } on Exception catch (e) {
        yield MainError(e.toString());
      }
    } else if (event is GetFolderById) {
      try {
        yield MainLoading();
        var documents = await documentRepository.getFolderById(event.folderId);
        yield GetFolderSucceed(documents, documents.current.title);
      } on Exception catch (e) {
        yield MainError(e.toString());
      }
    }
  }
}
