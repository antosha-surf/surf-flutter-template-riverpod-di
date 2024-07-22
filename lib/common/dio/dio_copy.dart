import 'package:dio/dio.dart';

/// Extension on [Dio] to create a new instance with
/// the given [options] and [interceptors].
extension DioXCopyWith on Dio {
  /// Returns a new [Dio] instance with the given [options].
  Dio copyWith({
    BaseOptions? options,
    List<Interceptor>? interceptors,
  }) {
    final dio = Dio(options ?? this.options);

    dio.interceptors.addAll(interceptors ?? this.interceptors);

    return dio;
  }
}
