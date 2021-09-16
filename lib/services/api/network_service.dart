library network;

import 'package:test_app/services/api/rest_service.dart';

import 'i_rest_service.dart';

export 'rest_service.dart';
export 'api_response.dart';
export 'api_exception.dart';
export 'i_rest_service.dart';

class NetworkServiceFactory {
  static IRestService _instance = RestService();
  static IRestService getInstance() => _instance;
}
