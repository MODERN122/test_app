import 'package:test_app/models/filter_type.dart';

import 'api_response.dart';

abstract class IRestService {
  set token(String token);

  void deleteToken();

  /* Пользователь / Авторизация */
  Future<ApiResponse> auth(
    String userName,
    String password,
    String? provider,
    String? accessToken,
  );

  Future<ApiResponse> getMyDocuments(
      {String? userIdOrGroupId, FilterType filterType = FilterType.None});
  Future<ApiResponse> getCommonDocuments(
      {String? userIdOrGroupId, FilterType filterType = FilterType.None});
  Future<ApiResponse> getProfile();
  Future<ApiResponse> getFolderById(int folderId,
      {String? userIdOrGroupId, FilterType filterType = FilterType.None});
}
