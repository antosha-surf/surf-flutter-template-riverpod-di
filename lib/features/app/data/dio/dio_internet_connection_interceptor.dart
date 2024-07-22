import 'dart:io';
import 'package:dio/dio.dart';
import 'package:architalk/core/architecture/domain/entities/failures/failures.dart';

/// Dio Internet Connection Interceptor.
class NoInternetConnectionInterceptor extends QueuedInterceptor {
  /// @nodoc.
  NoInternetConnectionInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_shouldThrowNoInternetExcpetion(err)) {
      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          message: 'No internet connection.',
          error: const CommonFailure.noInternet(),
        ),
      );
    } else {
      handler.next(err);
    }
  }

  bool _shouldThrowNoInternetExcpetion(DioException err) {
    return err.type == DioExceptionType.connectionError &&
        err.error != null &&
        err.error is SocketException;
  }
}
