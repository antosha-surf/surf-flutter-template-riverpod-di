// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginationRequest<PageInfoType> {
  PageInfoType get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
}

/// @nodoc

class _$PaginationRequestImpl<PageInfoType>
    implements _PaginationRequest<PageInfoType> {
  const _$PaginationRequestImpl({required this.page, required this.limit});

  @override
  final PageInfoType page;
  @override
  final int limit;

  @override
  String toString() {
    return 'PaginationRequest<$PageInfoType>(page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationRequestImpl<PageInfoType> &&
            const DeepCollectionEquality().equals(other.page, page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(page), limit);
}

abstract class _PaginationRequest<PageInfoType>
    implements PaginationRequest<PageInfoType> {
  const factory _PaginationRequest(
      {required final PageInfoType page,
      required final int limit}) = _$PaginationRequestImpl<PageInfoType>;

  @override
  PageInfoType get page;
  @override
  int get limit;
}
