import 'dart:async';

import 'package:dio/dio.dart';

import 'interceptor/logger_interceptor.dart';

class DioClient {
  static late Dio _dio;
  static FutureOr<Dio> setUp({required String baseUrl}) async {
    final options = BaseOptions(
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: baseUrl,
      receiveTimeout: 30000, //30s
      sendTimeout: 30000, //30s
    );
    // Add log in debug mode
    // _dio.interceptors.add(
    //   LoggerInterceptor(),
    // );

    _dio = Dio(options);
    return _dio;
  }

  static Dio get dio => _dio;
}
