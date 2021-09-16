import 'package:test_app/models/filter_type.dart';
import 'package:test_app/services/storage/storage.dart';

import 'api_exception.dart';
import 'api_request.dart';
import 'api_response.dart';
import 'i_rest_service.dart';
import 'request_sender.dart';
import 'rest_method.dart';

class RestService implements IRestService {
  IRequestSender _router = RequestSenderFactory.getInstance();

  @override
  set token(String token) {
    _router.token = token;
  }

  @override
  void deleteToken() {
    Storage storage = Storage();
    storage.deleteToken();
  }

  ApiResponse _checkSuccessResponse(ApiResponse response) {
    if (response.statusCode ~/ 100 == 2) {
      return response;
    } else {
      throw ApiException.fromApiResponse(response);
    }
  }

  /* Пользователь / Авторизация */
  @override
  Future<ApiResponse> auth(
    String userName,
    String password,
    String? provider,
    String? accessToken,
  ) async {
    ApiRequest request = ApiRequest(
        method: RestMethod.post,
        path: '/api/2.0/authentication',
        body: {
          "userName": userName,
          "password": password,
          // "provider": provider,
          // "accessToken": accessToken,
        });
    ApiResponse response = await _router.sendRequest(request);
    return _checkSuccessResponse(response);
  }

  @override
  Future<ApiResponse> getMyDocuments({
    String? userIdOrGroupId,
    FilterType filterType = FilterType.None,
  }) async {
    ApiRequest request = ApiRequest(
        method: RestMethod.get,
        path: '/api/2.0/files/@my',
        queryParameters: {
          "userIdOrGroupId": userIdOrGroupId,
          "filterType": filterType.inString,
        });
    ApiResponse response = await _router.sendRequest(request);
    return _checkSuccessResponse(response);
  }

  @override
  Future<ApiResponse> getCommonDocuments({
    String? userIdOrGroupId,
    FilterType filterType = FilterType.None,
  }) async {
    ApiRequest request = ApiRequest(
        method: RestMethod.get,
        path: '/api/2.0/files/@common',
        queryParameters: {
          "userIdOrGroupId": userIdOrGroupId,
          "filterType": filterType.inString,
        }
        );
    ApiResponse response = await _router.sendRequest(request);
    return _checkSuccessResponse(response);
  }

  @override
  Future<ApiResponse> getFolderById(
    int folderId, {
    String? userIdOrGroupId,
    FilterType filterType = FilterType.None,
  }) async {
    ApiRequest request = ApiRequest(
        method: RestMethod.get,
        path: '/api/2.0/files/$folderId',
        queryParameters: {
          "userIdOrGroupId": userIdOrGroupId,
          "filterType": filterType.inString,
        });
    ApiResponse response = await _router.sendRequest(request);
    return _checkSuccessResponse(response);
  }

  @override
  Future<ApiResponse> getProfile() async {
    ApiRequest request = ApiRequest(
      method: RestMethod.get,
      path: '/api/2.0/people/@self',
    );
    ApiResponse response = await _router.sendRequest(request);
    return _checkSuccessResponse(response);
  }
}
