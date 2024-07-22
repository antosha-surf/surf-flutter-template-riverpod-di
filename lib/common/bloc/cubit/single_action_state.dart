part of 'single_action_cubit.dart';

/// A state for a [SingleActionCubit].
/// Can be in one of the following states:
/// - [SAInitial] - initial state
/// - [SALoading] - loading state
/// - [SASuccess] - success state
/// - [SAFailure] - failure state
sealed class SingleActionState<T> {
  /// @nodoc.
  const SingleActionState();

  /// Checks if the state is [SAInitial].
  bool get isInitial => this is SAInitial<T>;

  /// Checks if the state is [SALoading].
  bool get isLoading => this is SALoading<T>;

  /// Checks if the state is [SASuccess].
  bool get isSuccess => this is SASuccess<T>;

  /// Checks if the state is [SAFailure].
  bool get isFailure => this is SAFailure<T>;

  /// Get data from success state.
  /// Will assert if the state is not [SASuccess].
  T get data {
    assert(isSuccess);
    return (this as SASuccess<T>).result;
  }

  /// Get failure from failure state.
  /// Will assert if the state is not [SAFailure].
  Failure get failure {
    assert(isFailure);
    return (this as SAFailure<T>)._failure;
  }
}

/// Initial state of a [SingleActionCubit].
class SAInitial<T> extends SingleActionState<T> {
  /// @nodoc.
  const SAInitial();
}

/// Loading state of a [SingleActionCubit].
class SALoading<T> extends SingleActionState<T> {
  /// @nodoc.
  const SALoading();
}

/// Success state of a [SingleActionCubit].
class SASuccess<T> extends SingleActionState<T> {
  /// Result of computation.
  final T result;

  /// @nodoc.
  const SASuccess(this.result);
}

/// Failure state of a [SingleActionCubit].
class SAFailure<T> extends SingleActionState<T> {
  /// Failure that occurred.
  final Failure _failure;

  /// @nodoc.
  const SAFailure(this._failure);
}
