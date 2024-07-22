import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_request.freezed.dart';

@Freezed(
  genericArgumentFactories: true,
  copyWith: false,
  toJson: false,
  fromJson: false,
)
class PaginationRequest<PageInfoType> with _$PaginationRequest {
  const factory PaginationRequest({
    required PageInfoType page,
    required int limit,
  }) = _PaginationRequest;
}
