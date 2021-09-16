import 'package:test_app/services/api/i_rest_service.dart';
import 'package:test_app/services/api/network_service.dart';
import 'package:test_app/services/storage/storage.dart';

class AuthRepository {
  final IRestService _restService = NetworkServiceFactory.getInstance();
  final Storage storage;

  AuthRepository({
    required this.storage,
  });

  Future<bool> login(String userName, String password,
      {String? provider, String? accessToken}) async {
    ApiResponse result =
        await _restService.auth(userName, password, provider, accessToken);
    _restService.token = result.result['token'];
    await storage.saveToken(result.result['token']);
    return true;
  }

  logout() {
    storage.deleteToken();
    _restService.deleteToken();
  }
}
