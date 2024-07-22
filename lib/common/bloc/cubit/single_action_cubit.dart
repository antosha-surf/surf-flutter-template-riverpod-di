import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';

part 'single_action_state.dart';

/// Base class for cubits that do one thing (action)
/// and report the result of this thing (action).
abstract class SingleActionCubit<T> extends Cubit<SingleActionState<T>> {
  /// @nodoc.
  SingleActionCubit() : super(SAInitial<T>());

  /// An asynchronous action to be defined in a subclass.
  @protected
  RequestOperation<T> action();

  /// A function to abstract away the action execution
  /// and flow control.
  Future<void> performAction() async {
    if (state.isLoading) return;
    emit(SALoading<T>());
    final res = await action();
    if (res.isSuccess) {
      emit(SASuccess<T>(res.data));
    } else {
      emit(SAFailure<T>(res.failure));
    }
  }
}

/// A one-param variant of [SingleActionCubit].
abstract class SingleActionCubitWithParam<T, P>
    extends Cubit<SingleActionState<T>> {
  /// @nodoc.
  SingleActionCubitWithParam() : super(SAInitial<T>());

  /// An asynchronous action to be defined in a subclass.
  @protected
  RequestOperation<T> action(P data);

  /// A function to abstract away the action execution
  /// and flow control.
  Future<void> performAction(P data) async {
    if (state.isLoading) return;
    emit(SALoading<T>());
    final res = await action(data);
    if (res.isSuccess) {
      emit(SASuccess<T>(res.data));
    } else {
      emit(SAFailure<T>(res.failure));
    }
  }
}
