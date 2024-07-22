// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationDto<T> _$PaginationDtoFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _PaginationDto<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginationDto<T> {
  List<T> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationDtoCopyWith<T, PaginationDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationDtoCopyWith<T, $Res> {
  factory $PaginationDtoCopyWith(
          PaginationDto<T> value, $Res Function(PaginationDto<T>) then) =
      _$PaginationDtoCopyWithImpl<T, $Res, PaginationDto<T>>;
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class _$PaginationDtoCopyWithImpl<T, $Res, $Val extends PaginationDto<T>>
    implements $PaginationDtoCopyWith<T, $Res> {
  _$PaginationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationDtoImplCopyWith<T, $Res>
    implements $PaginationDtoCopyWith<T, $Res> {
  factory _$$PaginationDtoImplCopyWith(_$PaginationDtoImpl<T> value,
          $Res Function(_$PaginationDtoImpl<T>) then) =
      __$$PaginationDtoImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> items});
}

/// @nodoc
class __$$PaginationDtoImplCopyWithImpl<T, $Res>
    extends _$PaginationDtoCopyWithImpl<T, $Res, _$PaginationDtoImpl<T>>
    implements _$$PaginationDtoImplCopyWith<T, $Res> {
  __$$PaginationDtoImplCopyWithImpl(_$PaginationDtoImpl<T> _value,
      $Res Function(_$PaginationDtoImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$PaginationDtoImpl<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginationDtoImpl<T> implements _PaginationDto<T> {
  const _$PaginationDtoImpl({required final List<T> items}) : _items = items;

  factory _$PaginationDtoImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$PaginationDtoImplFromJson(json, fromJsonT);

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PaginationDto<$T>(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationDtoImpl<T> &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationDtoImplCopyWith<T, _$PaginationDtoImpl<T>> get copyWith =>
      __$$PaginationDtoImplCopyWithImpl<T, _$PaginationDtoImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginationDtoImplToJson<T>(this, toJsonT);
  }
}

abstract class _PaginationDto<T> implements PaginationDto<T> {
  const factory _PaginationDto({required final List<T> items}) =
      _$PaginationDtoImpl<T>;

  factory _PaginationDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$PaginationDtoImpl<T>.fromJson;

  @override
  List<T> get items;
  @override
  @JsonKey(ignore: true)
  _$$PaginationDtoImplCopyWith<T, _$PaginationDtoImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
