// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_storage_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenStorageStateImpl _$$TokenStorageStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenStorageStateImpl(
      tokens:
          (json['tokens'] as List<dynamic>).map((e) => e as String).toList(),
      currentlyUsedToken: json['currentlyUsedToken'] as String?,
    );

Map<String, dynamic> _$$TokenStorageStateImplToJson(
        _$TokenStorageStateImpl instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
      'currentlyUsedToken': instance.currentlyUsedToken,
    };
