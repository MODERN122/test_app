

import 'rest_method.dart';

class ApiRequest{
  final RestMethod method;
  /// путь после основного url
  final String path;
  ///Использовать таймаут запроса
  final bool withTimeout;
  /// флаг MultiPart request, для отправки файлов, она реализуется иначе
  final bool isMultipart;
  /// параметры запроса в строке запроса
  final Map<String, dynamic>? queryParameters;
  /// тело запроса
  final Map<String, dynamic>? body;

  ApiRequest({
    required this.method,
    required this.path,
    this.withTimeout=true,
    this.isMultipart=false,
    this.queryParameters,
    this.body,
  });

  /// конструктор для простого GET-запроса, с меньшим бойлерплейтом
  factory ApiRequest.simpleGet(String path,{
    Map<String, dynamic>? queryParameters
  })=>ApiRequest(
    method: RestMethod.get,
    path: path,
    queryParameters: queryParameters,
  );

  /// конструктор для простого POST-запроса, с меньшим бойлерплейтом
  factory ApiRequest.simplePost(String path,{
    Map<String, dynamic>? queryParameters
  })=>ApiRequest(
    method: RestMethod.post,
    path: path,
    queryParameters: queryParameters,
  );
}