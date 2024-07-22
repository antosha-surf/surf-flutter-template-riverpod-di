import 'package:architalk/common/pagination/domain/entities/pagination_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:architalk/common/pagination/domain/entities/pagination.dart';

import 'package:architalk/core/architecture/domain/entities/entities.dart';
import 'package:architalk/core/architecture/presentation/base_bloc.dart';

part 'state.dart';
part 'cubit.freezed.dart';

/// {@template paginationCubit.class}
/// Base pagination cubit that expects api to return [Pagination].
///
/// Example usage:
///
/// ```dart
///  class UserPaginationCubit extends PaginationCubit<User> {
///    final UserRepository repo; //or use getIt
///
///    @override
///    Future<Result<Pagination<User>>> repoCall(SortKey? sortKey) {
///      final repo = this.repo; // or use getIt;
///      return repo.getUsers(sortKey: sortKey, limit: state.limit);
///    }
///  }
/// ```
///
/// Usage:
///
/// ``` dart
/// BlocConsumer<UserPaginationCubit, PaginationState<User>>(
///   listener: (ctx, state) {
///     if (state.lastError != null) {
///       // show error to user
///     }
///   },
///   builder: (ctx, state) {
///     return ...
///   },
/// ),
/// ```
/// {@endtemplate}
abstract class PaginationCubit<PageInfoType, ItemType>
    extends Cubit<PaginationState<PageInfoType, ItemType>> with BlocCoverage {
  final PageInfoType _startingPage;

  /// {@macro paginationCubit.class}
  PaginationCubit({
    required int limit,
    required PageInfoType startingPage,
  })  : _startingPage = startingPage,
        super(
          PaginationState(
            status: PaginationStatus.success,
            limit: limit,
            items: List<ItemType>.empty(),
            nextPage: startingPage,
            canLoadMore: true,
          ),
        );

  /// Calls repo to get data of type [T].
  RequestOperation<Pagination<PageInfoType, ItemType>> repoCall(
      PaginationRequest request);

  Future<void> _load({bool fromStart = false}) async {
    if (state.status.isLoading) return;
    emit(
      state.copyWith(
        status: PaginationStatus.loading,
        nextPage: fromStart ? _startingPage : state.nextPage,
        items: fromStart ? <ItemType>[] : state.items,
        lastError: null,
      ) as PaginationState<PageInfoType, ItemType>,
    );

    final res = await runWithCoverage(
      () async {
        return repoCall(
          PaginationRequest(
            page: state.nextPage,
            limit: state.limit,
          ),
        );
      },
    );

    if (res.isSuccess) {
      emit(
        state.copyWith(
          status: PaginationStatus.success,
          items: fromStart
              ? List<ItemType>.from(res.data.items)
              : (List<ItemType>.from(state.items)..addAll(res.data.items)),
          canLoadMore: state.limit == res.data.items.length,
          nextPage: res.data.nextPage,
          lastError: null,
        ) as PaginationState<PageInfoType, ItemType>,
      );
    } else {
      emit(
        state.copyWith(
          status: PaginationStatus.failure,
          lastError: res.failure,
        ) as PaginationState<PageInfoType, ItemType>,
      );
    }
  }

  /// Load data.
  Future<void> load() {
    return _load();
  }

  /// Load data from start.
  Future<void> loadFromStart() {
    return _load(fromStart: true);
  }
}
