import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';

/// Error handler from specific [Exception] to [Failure].
class ErrorHandler {
  const ErrorHandler._();

  /// Request handler.
  static RequestOperation<T> handle<T>(
    Future<T> Function() action, {
    Result<T, Failure> Function(Failure f, [StackTrace? st])? onFailure,
    List<ErrorHandleStrategy> additionalStrategies = const [],
  }) async {
    assert(
      !_defaultErrorStrategies.any(
        (defaultStrategy) => additionalStrategies.any(
          (additionalStrategy) =>
              defaultStrategy._typeForHandle ==
              additionalStrategy._typeForHandle,
        ),
      ),
      'Default strategies and additional strategies must not have the same error types.',
    );

    try {
      return Result.ok(await action());
    } on Exception catch (e, stackTrace) {
      final strategies = {
        ...additionalStrategies,
        ..._defaultErrorStrategies,
      };

      final match = strategies.firstWhereOrNull(
        (strategy) => strategy._typeForHandle == e.runtimeType,
      );

      final failure = match?.call(e, stackTrace) ??
          Failure(
            original: e,
            trace: stackTrace,
          );

      return onFailure?.call(failure, stackTrace) ?? Result.failed(failure);
    }
  }
}

/// Default error handler strategy.
const List<ErrorHandleStrategy> _defaultErrorStrategies = [
  DioErrorStrategy(),
  UnknownStrategy(),
];

/// Error handler strategy interface.
@immutable
abstract class ErrorHandleStrategy<E extends Exception> {
  @override
  int get hashCode => E.hashCode;

  Type get _typeForHandle => E;

  /// [ErrorHandleStrategy] constructor.
  const ErrorHandleStrategy();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorHandleStrategy && _typeForHandle == other._typeForHandle;

  /// Method for implementation strategy.
  Failure call(E e, StackTrace stackTrace);
}

/// Error handler for [DioException].
class DioErrorStrategy extends ErrorHandleStrategy<DioException> {
  /// [DioErrorStrategy] constructor.
  const DioErrorStrategy();

  @override
  Failure call(DioException e, StackTrace stackTrace) {
    return DioFailure(e, stackTrace: stackTrace);
  }
}

/// Error handler for [Exception].
class UnknownStrategy extends ErrorHandleStrategy<Exception> {
  /// [UnknownStrategy] constructor.
  const UnknownStrategy();

  @override
  Failure call(Exception e, StackTrace stackTrace) {
    return const CommonFailure.unknown();
  }
}
