import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:test_app/services/storage/storage.dart';

import '../../app_config.dart';
import 'api_exception.dart';
import 'api_response.dart';
import 'api_request.dart';

import 'rest_method.dart';

abstract class IRequestSender {
  set token(String token);

  Future<ApiResponse> sendRequest(ApiRequest request);
}

class RequestSenderFactory {
  static IRequestSender _instance = RequestSender();

  static IRequestSender getInstance() => _instance;
}

class RequestSender implements IRequestSender {
  Map<String, String> _headers = {};
  String token = "";

  @override
  Future<ApiResponse> sendRequest(ApiRequest request) async {
    Dio client = Dio();
    Storage storage = Storage();
    if (token == "") {
      if (await storage.containsToken()) {
        token = await storage.loadToken();
      }
      client.options.headers["Authorization"] = "$token";
    } else {
      client.options.headers["Authorization"] = "$token";
    }
    String uri =
        Uri.https(AppConfig.endpoint, request.path, request.queryParameters)
            .toString();

    final String body = json.encode(request.body);

    late Future requestFuture;

    switch (request.method) {
      case RestMethod.get:
        requestFuture = client.get(
          uri,
        );
        break;
      case RestMethod.post:
        requestFuture = client.post(
          uri,
          data: body,
        );
        break;
      case RestMethod.patch:
        requestFuture = client.patch(
          uri,
          data: body,
        );
        break;
      case RestMethod.delete:
        requestFuture = client.delete(
          uri,
        );
        break;
      case RestMethod.put:
        requestFuture = client.put(
          uri,
          data: body,
        );
        break;
    }

    late Response response;
    if (AppConfig.debugApiRequest) {
      log('╔════HTTP Request ═══════-');
      log('║ URL:     $uri');
      log('║ headers: ${client.options.headers}');
      log('║ body:    $body');
      log('║ method:  ${request.method}');
      log('╚═══════════════════════─');
    }

    try {
      if (request.withTimeout) {
        response = await requestFuture.timeout(
            Duration(seconds: AppConfig.requestTimeout), onTimeout: () {
          throw ApiException(
              message: 'Превышено время ожидания ответа от сервера',
              statusCode: 504);
        });
      } else {
        response = await requestFuture;
      }
    } catch (e) {
      String errorMessage = (e is DioError)
          ? (e.response!.data['error'] as Map<String, dynamic>)['message']
          : e.toString();
      if (AppConfig.debugApiRequest) {
        log('╔═══════ HTTP ERROR ═══════-');
        log('║ URL:     $uri');
        log('║ headers: ${client.options.headers}');
        log('║ body:    $body');
        log('║ method:  ${request.method}');
        log('║ ERROR:   $errorMessage');
        log('╚══════════════════════════─');
      }
      throw ApiException(message: errorMessage);
    }

    ApiResponse apiResponse = ApiResponse.fromResponse(response);
    if (AppConfig.debugApiRequest) {
      log('╔═══════ HTTP Response ═══════-');
      log('║ URL:      $uri');
      log('║ headers:  ${client.options.headers}');
      log('║ body:     $body');
      log('║ method:   ${request.method}');
      log('║ response: $apiResponse');
      log('╚═════════════════════════════─');
    }

    return apiResponse;
  }
}
