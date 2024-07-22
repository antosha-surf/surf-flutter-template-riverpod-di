part of 'cubit.dart';

typedef PageNumPaginationState<ItemType> = PaginationState<int, ItemType>;

typedef CursorPaginationState<ItemType> = PaginationState<String?, ItemType>;

/// State for [PaginationCubit].
@Freezed(genericArgumentFactories: true)
class PaginationState<PageInfoType, ItemType> with _$PaginationState {
  /// @nodoc.
  const factory PaginationState({
    required PaginationStatus status,
    required int limit,
    required List<ItemType> items,
    required bool canLoadMore,
    required PageInfoType nextPage,
    Failure? lastError,
  }) = _PaginationState;
}

/// Enum of pagination status.
enum PaginationStatus {
  /// Pagination in progress state.
  loading,

  /// Pagination in failure state (pagination completed with error).
  failure,

  /// Pagination in success state.
  success
}

/// Extension of pagination status.
extension PaginationStatusX on PaginationStatus {
  /// Pagination status is [PaginationStatus.loading].
  bool get isLoading => this == PaginationStatus.loading;

  /// Pagination status is [PaginationStatus.failure].
  bool get isFailure => this == PaginationStatus.failure;

  /// Pagination status is [PaginationStatus.success].
  bool get isSuccess => this == PaginationStatus.success;
}
