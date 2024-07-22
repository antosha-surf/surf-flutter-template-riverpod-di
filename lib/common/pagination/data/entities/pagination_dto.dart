import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_dto.freezed.dart';
part 'pagination_dto.g.dart';

@Freezed(genericArgumentFactories: true)

/// DTO class for pagination.
class PaginationDto<T> with _$PaginationDto<T> {
  /// @nodoc.
  const factory PaginationDto({
    required List<T> items,
  }) = _PaginationDto;

  /// @nodoc.
  factory PaginationDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJson,
  ) =>
      _$PaginationDtoFromJson<T>(json, fromJson);
}
