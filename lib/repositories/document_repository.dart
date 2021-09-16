import 'package:test_app/models/folder.dart';
import 'package:test_app/services/api/i_rest_service.dart';
import 'package:test_app/services/api/network_service.dart';

class DocumentRepository {
  final IRestService _restService = NetworkServiceFactory.getInstance();

  Future<FolderFull> getMyDocuments() async {
    ApiResponse result = await _restService.getMyDocuments();
    var response = FolderFull.fromJson( result.result);
    return response;
  }

  Future<FolderFull> getCommonDocuments() async {
    ApiResponse result = await _restService.getCommonDocuments();
    var response = FolderFull.fromJson( result.result);
    return response;
  }

  Future<FolderFull> getFolderById(int folderId) async {
    ApiResponse result = await _restService.getFolderById(folderId);
    var response = FolderFull.fromJson( result.result);
    return response;
  }
}
