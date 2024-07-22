import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

/// Domain class for pagination.
@Freezed(genericArgumentFactories: true)
class Pagination<PageInfoType, ItemType>
    with _$Pagination<PageInfoType, ItemType> {
  /// @nodoc.
  const factory Pagination({
    required List<ItemType> items,
    required PageInfoType nextPage,
  }) = _Pagination;

  /// @nodoc.
  factory Pagination.fromJson(
    Map<String, dynamic> json, {
    required ItemType Function(Object? json) itemFromJson,
    required PageInfoType Function(Object? json) pageInfoFromJson,
  }) =>
      _$PaginationFromJson<PageInfoType, ItemType>(
        json,
        pageInfoFromJson,
        itemFromJson,
      );
}
