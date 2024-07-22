import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architalk/common/utils/logger/i_log_writer.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';

/// Typedef for repository method call.
typedef RequestCall<T> = RequestOperation<T> Function();

/// A mixin for BLoCs and Cubits that provides a method for calling
/// repository methods. It handles repository-level exceptions and returns
/// the result of the operation.
mixin BlocCoverage<State> on BlocBase<State> {
  /// {@macro i_log_writer.class}
  ILogWriter? get logWriter;

  /// Call repository method. All repository calls must be made through this method.
  @protected
  RequestOperation<T> runWithCoverage<T>(RequestCall<T> call) async {
    try {
      return await call();
    } on Failure catch (failure) {
      _logFailure(failure);
      return Result.failed(failure);
    }
  }

  void _logFailure(Failure failure) {
    logWriter?.failure(failure);
  }
}
