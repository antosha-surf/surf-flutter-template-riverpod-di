// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginationState<PageInfoType, ItemType> {
  PaginationStatus get status => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  List<ItemType> get items => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  PageInfoType get nextPage => throw _privateConstructorUsedError;
  Failure<Object?>? get lastError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationStateCopyWith<PageInfoType, ItemType,
          PaginationState<PageInfoType, ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationStateCopyWith<PageInfoType, ItemType, $Res> {
  factory $PaginationStateCopyWith(
          PaginationState<PageInfoType, ItemType> value,
          $Res Function(PaginationState<PageInfoType, ItemType>) then) =
      _$PaginationStateCopyWithImpl<PageInfoType, ItemType, $Res,
          PaginationState<PageInfoType, ItemType>>;
  @useResult
  $Res call(
      {PaginationStatus status,
      int limit,
      List<ItemType> items,
      bool canLoadMore,
      PageInfoType nextPage,
      Failure<Object?>? lastError});
}

/// @nodoc
class _$PaginationStateCopyWithImpl<PageInfoType, ItemType, $Res,
        $Val extends PaginationState<PageInfoType, ItemType>>
    implements $PaginationStateCopyWith<PageInfoType, ItemType, $Res> {
  _$PaginationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? limit = null,
    Object? items = null,
    Object? canLoadMore = null,
    Object? nextPage = freezed,
    Object? lastError = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaginationStatus,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as PageInfoType,
      lastError: freezed == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as Failure<Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationStateImplCopyWith<PageInfoType, ItemType, $Res>
    implements $PaginationStateCopyWith<PageInfoType, ItemType, $Res> {
  factory _$$PaginationStateImplCopyWith(
          _$PaginationStateImpl<PageInfoType, ItemType> value,
          $Res Function(_$PaginationStateImpl<PageInfoType, ItemType>) then) =
      __$$PaginationStateImplCopyWithImpl<PageInfoType, ItemType, $Res>;
  @override
  @useResult
  $Res call(
      {PaginationStatus status,
      int limit,
      List<ItemType> items,
      bool canLoadMore,
      PageInfoType nextPage,
      Failure<Object?>? lastError});
}

/// @nodoc
class __$$PaginationStateImplCopyWithImpl<PageInfoType, ItemType, $Res>
    extends _$PaginationStateCopyWithImpl<PageInfoType, ItemType, $Res,
        _$PaginationStateImpl<PageInfoType, ItemType>>
    implements _$$PaginationStateImplCopyWith<PageInfoType, ItemType, $Res> {
  __$$PaginationStateImplCopyWithImpl(
      _$PaginationStateImpl<PageInfoType, ItemType> _value,
      $Res Function(_$PaginationStateImpl<PageInfoType, ItemType>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? limit = null,
    Object? items = null,
    Object? canLoadMore = null,
    Object? nextPage = freezed,
    Object? lastError = freezed,
  }) {
    return _then(_$PaginationStateImpl<PageInfoType, ItemType>(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PaginationStatus,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ItemType>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as PageInfoType,
      lastError: freezed == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as Failure<Object?>?,
    ));
  }
}

/// @nodoc

class _$PaginationStateImpl<PageInfoType, ItemType>
    implements _PaginationState<PageInfoType, ItemType> {
  const _$PaginationStateImpl(
      {required this.status,
      required this.limit,
      required final List<ItemType> items,
      required this.canLoadMore,
      required this.nextPage,
      this.lastError})
      : _items = items;

  @override
  final PaginationStatus status;
  @override
  final int limit;
  final List<ItemType> _items;
  @override
  List<ItemType> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool canLoadMore;
  @override
  final PageInfoType nextPage;
  @override
  final Failure<Object?>? lastError;

  @override
  String toString() {
    return 'PaginationState<$PageInfoType, $ItemType>(status: $status, limit: $limit, items: $items, canLoadMore: $canLoadMore, nextPage: $nextPage, lastError: $lastError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationStateImpl<PageInfoType, ItemType> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            const DeepCollectionEquality().equals(other.nextPage, nextPage) &&
            (identical(other.lastError, lastError) ||
                other.lastError == lastError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      limit,
      const DeepCollectionEquality().hash(_items),
      canLoadMore,
      const DeepCollectionEquality().hash(nextPage),
      lastError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationStateImplCopyWith<PageInfoType, ItemType,
          _$PaginationStateImpl<PageInfoType, ItemType>>
      get copyWith => __$$PaginationStateImplCopyWithImpl<
          PageInfoType,
          ItemType,
          _$PaginationStateImpl<PageInfoType, ItemType>>(this, _$identity);
}

abstract class _PaginationState<PageInfoType, ItemType>
    implements PaginationState<PageInfoType, ItemType> {
  const factory _PaginationState(
          {required final PaginationStatus status,
          required final int limit,
          required final List<ItemType> items,
          required final bool canLoadMore,
          required final PageInfoType nextPage,
          final Failure<Object?>? lastError}) =
      _$PaginationStateImpl<PageInfoType, ItemType>;

  @override
  PaginationStatus get status;
  @override
  int get limit;
  @override
  List<ItemType> get items;
  @override
  bool get canLoadMore;
  @override
  PageInfoType get nextPage;
  @override
  Failure<Object?>? get lastError;
  @override
  @JsonKey(ignore: true)
  _$$PaginationStateImplCopyWith<PageInfoType, ItemType,
          _$PaginationStateImpl<PageInfoType, ItemType>>
      get copyWith => throw _privateConstructorUsedError;
}
