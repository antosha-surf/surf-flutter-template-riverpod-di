import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

/// A holder class to create Dio instances.
class DioCreator {
  /// Creates a new [Dio] instance with the given [baseUrl] and [interceptors].
  static Dio createDioInstance({
    required String baseUrl,
    List<Interceptor> interceptors = const [],
    String? contentType,
  }) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = baseUrl
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout
      ..contentType = 'application/json';

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      return HttpClient();
    };

    dio.interceptors.addAll([
      ...interceptors,
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
    ]);

    return dio;
  }
}
