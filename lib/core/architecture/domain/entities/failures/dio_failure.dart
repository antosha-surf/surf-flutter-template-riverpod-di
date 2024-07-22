import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';

part 'dio_failure.freezed.dart';

/// This failure is emitted when we encounter a DieException in the data layer.
@Freezed(copyWith: false)
class DioFailure with _$DioFailure implements Failure {
  @override
  DioException get original => dioException;

  @override
  StackTrace? get trace => stackTrace;

  const DioFailure._();

  /// Wrapper around [DioException].
  const factory DioFailure(
    DioException dioException, {
    StackTrace? stackTrace,
  }) = _DioFailure;
}
