// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pagination<PageInfoType, ItemType> _$PaginationFromJson<PageInfoType, ItemType>(
    Map<String, dynamic> json,
    PageInfoType Function(Object?) fromJsonPageInfoType,
    ItemType Function(Object?) fromJsonItemType) {
  return _Pagination<PageInfoType, ItemType>.fromJson(
      json, fromJsonPageInfoType, fromJsonItemType);
}

/// @nodoc
mixin _$Pagination<PageInfoType, ItemType> {
  List<ItemType> get items => throw _privateConstructorUsedError;
  PageInfoType get nextPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(PageInfoType) toJsonPageInfoType,
          Object? Function(ItemType) toJsonItemType) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationCopyWith<PageInfoType, ItemType,
          Pagination<PageInfoType, ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<PageInfoType, ItemType, $Res> {
  factory $PaginationCopyWith(Pagination<PageInfoType, ItemType> value,
          $Res Function(Pagination<PageInfoType, ItemType>) then) =
      _$PaginationCopyWithImpl<PageInfoType, ItemType, $Res,
          Pagination<PageInfoType, ItemType>>;
  @useResult
  $Res call({List<ItemType> items, PageInfoType nextPage});
}

/// @nodoc
class _$PaginationCopyWithImpl<PageInfoType, ItemType, $Res,
        $Val extends Pagination<PageInfoType, ItemType>>
    implements $PaginationCopyWith<PageInfoType, ItemType, $Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as PageInfoType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<PageInfoType, ItemType, $Res>
    implements $PaginationCopyWith<PageInfoType, ItemType, $Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl<PageInfoType, ItemType> value,
          $Res Function(_$PaginationImpl<PageInfoType, ItemType>) then) =
      __$$PaginationImplCopyWithImpl<PageInfoType, ItemType, $Res>;
  @override
  @useResult
  $Res call({List<ItemType> items, PageInfoType nextPage});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<PageInfoType, ItemType, $Res>
    extends _$PaginationCopyWithImpl<PageInfoType, ItemType, $Res,
        _$PaginationImpl<PageInfoType, ItemType>>
    implements _$$PaginationImplCopyWith<PageInfoType, ItemType, $Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl<PageInfoType, ItemType> _value,
      $Res Function(_$PaginationImpl<PageInfoType, ItemType>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextPage = freezed,
  }) {
    return _then(_$PaginationImpl<PageInfoType, ItemType>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as PageInfoType,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginationImpl<PageInfoType, ItemType>
    implements _Pagination<PageInfoType, ItemType> {
  const _$PaginationImpl(
      {required final List<ItemType> items, required this.nextPage})
      : _items = items;

  factory _$PaginationImpl.fromJson(
          Map<String, dynamic> json,
          PageInfoType Function(Object?) fromJsonPageInfoType,
          ItemType Function(Object?) fromJsonItemType) =>
      _$$PaginationImplFromJson(json, fromJsonPageInfoType, fromJsonItemType);

  final List<ItemType> _items;
  @override
  List<ItemType> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final PageInfoType nextPage;

  @override
  String toString() {
    return 'Pagination<$PageInfoType, $ItemType>(items: $items, nextPage: $nextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl<PageInfoType, ItemType> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(nextPage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<PageInfoType, ItemType,
          _$PaginationImpl<PageInfoType, ItemType>>
      get copyWith => __$$PaginationImplCopyWithImpl<PageInfoType, ItemType,
          _$PaginationImpl<PageInfoType, ItemType>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(PageInfoType) toJsonPageInfoType,
      Object? Function(ItemType) toJsonItemType) {
    return _$$PaginationImplToJson<PageInfoType, ItemType>(
        this, toJsonPageInfoType, toJsonItemType);
  }
}

abstract class _Pagination<PageInfoType, ItemType>
    implements Pagination<PageInfoType, ItemType> {
  const factory _Pagination(
          {required final List<ItemType> items,
          required final PageInfoType nextPage}) =
      _$PaginationImpl<PageInfoType, ItemType>;

  factory _Pagination.fromJson(
          Map<String, dynamic> json,
          PageInfoType Function(Object?) fromJsonPageInfoType,
          ItemType Function(Object?) fromJsonItemType) =
      _$PaginationImpl<PageInfoType, ItemType>.fromJson;

  @override
  List<ItemType> get items;
  @override
  PageInfoType get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$PaginationImplCopyWith<PageInfoType, ItemType,
          _$PaginationImpl<PageInfoType, ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}
