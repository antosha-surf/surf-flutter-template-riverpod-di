// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginationImpl<PageInfoType, ItemType>
    _$$PaginationImplFromJson<PageInfoType, ItemType>(
  Map<String, dynamic> json,
  PageInfoType Function(Object? json) fromJsonPageInfoType,
  ItemType Function(Object? json) fromJsonItemType,
) =>
        _$PaginationImpl<PageInfoType, ItemType>(
          items:
              (json['items'] as List<dynamic>).map(fromJsonItemType).toList(),
          nextPage: fromJsonPageInfoType(json['nextPage']),
        );

Map<String, dynamic> _$$PaginationImplToJson<PageInfoType, ItemType>(
  _$PaginationImpl<PageInfoType, ItemType> instance,
  Object? Function(PageInfoType value) toJsonPageInfoType,
  Object? Function(ItemType value) toJsonItemType,
) =>
    <String, dynamic>{
      'items': instance.items.map(toJsonItemType).toList(),
      'nextPage': toJsonPageInfoType(instance.nextPage),
    };
