import 'dart:convert';

import 'package:dio/dio.dart';

class ApiResponse {
  final int statusCode;
  final dynamic result;

  ApiResponse({
    required this.statusCode,
    this.result,
  });

  factory ApiResponse.fromResponse(Response response) => ApiResponse(
      statusCode: response.statusCode!, result: response.data["response"]);

  @override
  String toString() {
    return 'ApiResponse(statusCode: $statusCode, result: $result)';
  }
}
