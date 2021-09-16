import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_response.dart';

class ApiException implements Exception{
  final int? statusCode;
  final String? message;
  final dynamic errors;

  ApiException({
    this.statusCode,
    this.message,
    this.errors,
  });

  factory ApiException.fromResponse(Response response){
    Map body = json.decode(response.data);
    return ApiException(
      statusCode: response.statusCode,
      message: body['message']??null,
      errors: body['errors']??null,
    );
  }
  factory ApiException.fromApiResponse(ApiResponse response){
    Map body = response.result;
    return ApiException(
      statusCode: response.statusCode,
      message: body['message']??null,
      errors: body['errors'] ?? null,
    );
  }

  @override
  String toString() => message ?? 'Unknown error';
}