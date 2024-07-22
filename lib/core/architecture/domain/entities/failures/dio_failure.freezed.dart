// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dio_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DioFailure {
  DioException get dioException => throw _privateConstructorUsedError;
  StackTrace? get stackTrace => throw _privateConstructorUsedError;
}

/// @nodoc

class _$DioFailureImpl extends _DioFailure {
  const _$DioFailureImpl(this.dioException, {this.stackTrace}) : super._();

  @override
  final DioException dioException;
  @override
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'DioFailure(dioException: $dioException, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DioFailureImpl &&
            (identical(other.dioException, dioException) ||
                other.dioException == dioException) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dioException, stackTrace);
}

abstract class _DioFailure extends DioFailure {
  const factory _DioFailure(final DioException dioException,
      {final StackTrace? stackTrace}) = _$DioFailureImpl;
  const _DioFailure._() : super._();

  @override
  DioException get dioException;
  @override
  StackTrace? get stackTrace;
}
