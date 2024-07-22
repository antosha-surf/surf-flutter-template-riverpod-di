import 'package:architalk/core/architecture/domain/entities/entities.dart';

/// Type for data mapper function.
typedef DataMapper<R, TData> = R Function(TData value);

/// {@template result.class}
/// Result of a function execution.
///
/// [Result.ok] - named constructor for a successful Result - [Result].
///
/// [Result.failed] - named constructor for a failed Result - [ResultFailed].
/// {@endtemplate}
sealed class Result<TData, TErr extends Failure> {
  /// {@macro result.class}
  const Result();

  /// {@macro result.class}
  const factory Result.ok(TData data) = ResultOk;

  /// {@macro result.class}
  const factory Result.failed(TErr failure) = ResultFailed;

  /// Map [ResultOk] to another inner type.
  Result<R, TErr> mapSuccess<R>(DataMapper<R, TData> mapper) {
    return switch (this) {
      ResultOk<TData, TErr>(:final data) => Result.ok(mapper(data)),
      ResultFailed<TData, TErr>(:final failure) => Result.failed(failure),
    };
  }

  /// Check if Result is successful.
  bool get isSuccess => this is ResultOk<TData, TErr>;

  /// Check if Result is failed.
  bool get isFailure => this is ResultFailed<TData, TErr>;

  /// Get failure if Result is failed.
  /// Caution: Will assert if Result is not [ResultFailed].
  TErr get failure {
    assert(isFailure);
    return (this as ResultFailed<TData, TErr>)._failure;
  }

  /// Get data if Result is successful.
  /// Caution: Will assert if Result is not [ResultOk].
  TData get data {
    assert(isSuccess);
    return (this as ResultOk<TData, TErr>)._data;
  }
}

/// {@macro result.class}
final class ResultOk<TData, TErr extends Failure> extends Result<TData, TErr> {
  /// Successful Result data.
  final TData _data;

  /// {@macro result.class}
  const ResultOk(this._data);
}

/// {@macro result.class}
final class ResultFailed<TData, TErr extends Failure>
    extends Result<TData, TErr> {
  /// Failed Result error.
  final TErr _failure;

  /// {@macro result.class}
  const ResultFailed(this._failure);
}
