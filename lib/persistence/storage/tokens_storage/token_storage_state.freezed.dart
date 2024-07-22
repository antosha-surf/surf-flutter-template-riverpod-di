// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_storage_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenStorageState _$TokenStorageStateFromJson(Map<String, dynamic> json) {
  return _TokenStorageState.fromJson(json);
}

/// @nodoc
mixin _$TokenStorageState {
  List<String> get tokens => throw _privateConstructorUsedError;
  String? get currentlyUsedToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenStorageStateCopyWith<TokenStorageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenStorageStateCopyWith<$Res> {
  factory $TokenStorageStateCopyWith(
          TokenStorageState value, $Res Function(TokenStorageState) then) =
      _$TokenStorageStateCopyWithImpl<$Res, TokenStorageState>;
  @useResult
  $Res call({List<String> tokens, String? currentlyUsedToken});
}

/// @nodoc
class _$TokenStorageStateCopyWithImpl<$Res, $Val extends TokenStorageState>
    implements $TokenStorageStateCopyWith<$Res> {
  _$TokenStorageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokens = null,
    Object? currentlyUsedToken = freezed,
  }) {
    return _then(_value.copyWith(
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentlyUsedToken: freezed == currentlyUsedToken
          ? _value.currentlyUsedToken
          : currentlyUsedToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenStorageStateImplCopyWith<$Res>
    implements $TokenStorageStateCopyWith<$Res> {
  factory _$$TokenStorageStateImplCopyWith(_$TokenStorageStateImpl value,
          $Res Function(_$TokenStorageStateImpl) then) =
      __$$TokenStorageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> tokens, String? currentlyUsedToken});
}

/// @nodoc
class __$$TokenStorageStateImplCopyWithImpl<$Res>
    extends _$TokenStorageStateCopyWithImpl<$Res, _$TokenStorageStateImpl>
    implements _$$TokenStorageStateImplCopyWith<$Res> {
  __$$TokenStorageStateImplCopyWithImpl(_$TokenStorageStateImpl _value,
      $Res Function(_$TokenStorageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokens = null,
    Object? currentlyUsedToken = freezed,
  }) {
    return _then(_$TokenStorageStateImpl(
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentlyUsedToken: freezed == currentlyUsedToken
          ? _value.currentlyUsedToken
          : currentlyUsedToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenStorageStateImpl implements _TokenStorageState {
  const _$TokenStorageStateImpl(
      {required final List<String> tokens, required this.currentlyUsedToken})
      : _tokens = tokens;

  factory _$TokenStorageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenStorageStateImplFromJson(json);

  final List<String> _tokens;
  @override
  List<String> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  @override
  final String? currentlyUsedToken;

  @override
  String toString() {
    return 'TokenStorageState(tokens: $tokens, currentlyUsedToken: $currentlyUsedToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenStorageStateImpl &&
            const DeepCollectionEquality().equals(other._tokens, _tokens) &&
            (identical(other.currentlyUsedToken, currentlyUsedToken) ||
                other.currentlyUsedToken == currentlyUsedToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tokens), currentlyUsedToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenStorageStateImplCopyWith<_$TokenStorageStateImpl> get copyWith =>
      __$$TokenStorageStateImplCopyWithImpl<_$TokenStorageStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenStorageStateImplToJson(
      this,
    );
  }
}

abstract class _TokenStorageState implements TokenStorageState {
  const factory _TokenStorageState(
      {required final List<String> tokens,
      required final String? currentlyUsedToken}) = _$TokenStorageStateImpl;

  factory _TokenStorageState.fromJson(Map<String, dynamic> json) =
      _$TokenStorageStateImpl.fromJson;

  @override
  List<String> get tokens;
  @override
  String? get currentlyUsedToken;
  @override
  @JsonKey(ignore: true)
  _$$TokenStorageStateImplCopyWith<_$TokenStorageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
