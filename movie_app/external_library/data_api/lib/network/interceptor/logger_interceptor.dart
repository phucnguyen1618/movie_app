import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// Convert data type json to String
String prettyJsonStr(Map<dynamic, dynamic> json) {
  final encoder = JsonEncoder.withIndent('  ', (data) => data.toString());
  return encoder.convert(json);
}

class LoggerInterceptor extends Interceptor {
  final Function(DioError)? onRequestError;

  //Đối với dữ liệu phản hồi trường hợp quá lớn, không cần hiển thị trên nhật ký
  final bool Function(Response)? ignoreReponseDataLog;

  LoggerInterceptor({
    this.onRequestError,
    this.ignoreReponseDataLog,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onRequest',
      'Time': DateTime.now().toString(),
      'baseUrl': options.baseUrl,
      'path': options.path,
      'method': options.method,
      'requestData': options.data,
      'queryParameters': options.queryParameters.toString(),
    }));
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onResponse',
      'Time': DateTime.now().toString(),
      'statusCode': response.statusCode,
      'baseUrl': response.requestOptions.baseUrl,
      'path': response.requestOptions.path,
      'method': response.requestOptions.method,
      if (ignoreReponseDataLog?.call(response) != false)
        'responseData': response.data.toString(),
    }));
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint(prettyJsonStr({
      'from': 'onError',
      'Time': DateTime.now().toString(),
      'baseUrl': err.requestOptions.baseUrl,
      'path': err.requestOptions.path,
      'type': err.type,
      'message': err.message,
      'statusCode': err.response?.statusCode,
      'error': err.error.toString(),
      'responseData': err.requestOptions.data,
    }));
    super.onError(err, handler);
  }
}
