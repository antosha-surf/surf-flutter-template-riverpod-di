// ignore_for_file: avoid_catches_without_on_clauses

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architalk/common/pagination/cubit.dart';

typedef PaginationListView<ModelClass,
        PagQ extends PaginationCubit<int, ModelClass>>
    = _PaginationListView<int, ModelClass, PagQ>;

/// [ListView] that supports pagination and works with [PaginationCubit].
class _PaginationListView<PageInfoClass, ModelClass,
        PagQ extends PaginationCubit<PageInfoClass, ModelClass>>
    extends StatefulWidget {
  /// Callback for [BlocConsumer] listener field.
  final void Function(
    BuildContext context,
    PaginationState<PageInfoClass, ModelClass> state,
  )? cubitListener;

  /// Scroll Controller.
  final ScrollController? scrollController;

  /// Builds when list is empty and state has [PaginationStatus.loading].
  final Widget Function(
    BuildContext context,
    PaginationState<PageInfoClass, ModelClass> state,
  )? emptyLoading;

  /// Builds when list is empty and state has [PaginationStatus.success].
  final Widget Function(
    BuildContext context,
    PaginationState<PageInfoClass, ModelClass> state,
  )? emptySuccess;

  /// Builds when list is empty and state has [PaginationStatus.failure].
  final Widget Function(
    BuildContext context,
    PaginationState<PageInfoClass, ModelClass> state,
  )? emptyFailure;

  /// Builds when list is not empty and state has [PaginationStatus.success].
  final Widget Function(
    BuildContext context,
    PaginationState<PageInfoClass, ModelClass> state,
    int index,
  ) itemBuilder;

  /// Builds separator widget.
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  /// Builds when list is not empty and state has [PaginationStatus.loading].
  final Widget Function(
    BuildContext context,
    PaginationState<PageInfoClass, ModelClass> state,
  )? trailingLoading;

  /// Builds when list is not empty and [PaginationState] loadmore field is false.
  final Widget Function(
    BuildContext context,
    PaginationState<PageInfoClass, ModelClass> state,
  )? trailingNoMoreItems;

  /// Builds when list is not empty and [PaginationState] and
  final Widget Function(
    BuildContext context,
    PaginationState<PageInfoClass, ModelClass> state,
  )? trailingFailure;

  /// Specify physics for this scroll view.
  final ScrollPhysics? physics;

  /// Padding for [ListView]
  final EdgeInsetsGeometry? padding;

  /// @nodoc.
  const _PaginationListView({
    required this.itemBuilder,
    this.physics,
    this.separatorBuilder,
    this.padding,
    this.scrollController,
    this.cubitListener,
    this.emptyLoading,
    this.emptySuccess,
    this.emptyFailure,
    this.trailingLoading,
    this.trailingNoMoreItems,
    this.trailingFailure,
    Key? key,
  }) : super(key: key);

  @override
  State<_PaginationListView<PageInfoClass, ModelClass, PagQ>> createState() =>
      _PaginationListViewState<PageInfoClass, ModelClass, PagQ>();
}

class _PaginationListViewState<PageInfoClass, ModelClass,
        PagQ extends PaginationCubit<PageInfoClass, ModelClass>>
    extends State<_PaginationListView<PageInfoClass, ModelClass, PagQ>> {
  late ScrollController scrollController;
  late PaginationCubit<PageInfoClass, ModelClass> bloc;

  void setScrollController() {
    if (widget.scrollController != null) {
      scrollController = widget.scrollController!;
    } else {
      scrollController = ScrollController();
      scrollController.addListener(setScrollListener);
    }
  }

  void setScrollListener() {
    if (scrollController.offset >
            scrollController.position.maxScrollExtent - 80.0 &&
        bloc.state.canLoadMore &&
        !bloc.state.status.isLoading) {
      bloc.load();
    }
  }

  @override
  void initState() {
    assert(
      () {
        try {
          BlocProvider.of<PagQ>(context);
          return true;
        } catch (_) {
          return false;
        }
      }(),
      'Could not find correct BlocProvider<PaginationCubit<${ModelClass.toString()}>>. Are your types correct?',
    );
    setScrollController();
    super.initState();
  }

  @override
  void didUpdateWidget(
    covariant _PaginationListView<PageInfoClass, ModelClass, PagQ> oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      scrollController.dispose();
      setScrollController();
    }
  }

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<PagQ>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PagQ, PaginationState<PageInfoClass, ModelClass>>(
      listener: (ctx, state) {
        widget.cubitListener?.call(ctx, state);
      },
      builder: (ctx, state) {
        if (state.items.isEmpty) {
          if (state.status.isLoading) {
            final builder = widget.emptyLoading;
            if (builder != null) return builder(ctx, state);
            return const _DefaultEmptyLoadingWidget();
          } else if (state.status.isFailure) {
            final builder = widget.emptyFailure;
            if (builder != null) return builder(ctx, state);
            return const _DefaultFailureWidget();
          } else {
            final builder = widget.emptySuccess;
            if (builder != null) return builder(ctx, state);
            return const _DefaultEmptySuccessWidget();
          }
        } else {
          return ListView.separated(
            physics: widget.physics,
            padding: widget.padding,
            controller: scrollController,
            itemBuilder: (ctx, index) {
              if (index == state.items.length) {
                if (state.status.isLoading) {
                  final builder = widget.trailingLoading;
                  if (builder != null) return builder(ctx, state);
                  return const _DefaultTrailingLoadingWidget();
                } else if (state.status.isFailure) {
                  final builder = widget.trailingFailure;
                  if (builder != null) return builder(ctx, state);
                  return const _DefaultFailureWidget();
                } else {
                  if (!state.canLoadMore) {
                    final builder = widget.trailingNoMoreItems;
                    if (builder != null) return builder(ctx, state);
                    return const _DefaultNoMoreItemsWidget();
                  }
                }
              } else {
                return widget.itemBuilder(ctx, state, index);
              }
              return null;
            },
            itemCount: state.items.length + 1,
            separatorBuilder: widget.separatorBuilder!,
          );
        }
      },
    );
  }
}

/*/// [SliverList] that supports pagination and works with [PaginationCubit].
class PaginationSliverList<SliverListCubit extends PaginationCubit<ModelClass>,
    ModelClass> extends StatefulWidget {
  /// Callback for [BlocConsumer] listener field.
  final void Function(
    BuildContext context,
    PaginationState<ModelClass> state,
  )? stateListener;

  /// Scroll Controller.
  final ScrollController? scrollController;

  /// Builds when list is empty and state has [PaginationStatus.init].
  final Widget Function(
    BuildContext context,
    PaginationState<ModelClass> state,
  )? emptyInitSliver;

  /// Builds when list is empty and state has [PaginationStatus.loading].
  final Widget Function(
    BuildContext context,
    PaginationState<ModelClass> state,
  )? emptyLoadingSliver;

  /// Builds when list is empty and state has [PaginationStatus.success].
  final Widget Function(
    BuildContext context,
    PaginationState<ModelClass> state,
  )? emptySuccessSliver;

  /// Builds when list is empty and state has [PaginationStatus.failure].
  final Widget Function(
    BuildContext context,
    PaginationState<ModelClass> state,
  )? emptyFailureSliver;

  /// Builds when list is not empty and state has [PaginationStatus.success].
  final Widget Function(
    BuildContext context,
    PaginationState<ModelClass> state,
    int index,
  ) itemBuilder;

  /// Builds when list is not empty and state has [PaginationStatus.loading].
  final Widget Function(
    BuildContext context,
    PaginationState<ModelClass> state,
  )? trailingLoading;

  /// Builds when list is not empty and [PaginationState] loadmore field is false.
  final Widget Function(
    BuildContext context,
    PaginationState<ModelClass> state,
  )? trailingNoMoreItems;

  /// Builds when list is not empty and [PaginationState] and
  final Widget Function(
    BuildContext context,
    PaginationState<ModelClass> state,
  )? trailingFailure;

  /// Specify physics for this scroll view.
  final ScrollPhysics? physics;

  /// @nodoc.
  const PaginationSliverList({
    required this.itemBuilder,
    this.physics,
    this.stateListener,
    this.scrollController,
    this.emptyInitSliver,
    this.emptyLoadingSliver,
    this.emptySuccessSliver,
    this.emptyFailureSliver,
    this.trailingLoading,
    this.trailingNoMoreItems,
    this.trailingFailure,
    Key? key,
  }) : super(key: key);

  @override
  State<PaginationSliverList<SliverListCubit, ModelClass>> createState() =>
      _PaginationSliverListState<SliverListCubit, ModelClass>();
}

class _PaginationSliverListState<
        SliverListCubit extends PaginationCubit<ModelClass>, ModelClass>
    extends State<PaginationSliverList<SliverListCubit, ModelClass>> {
  late ScrollController scrollController;
  late PaginationCubit<ModelClass> bloc;

  void setScrollController() {
    if (widget.scrollController != null) {
      scrollController = widget.scrollController!;
    } else {
      scrollController = ScrollController();
    }
    scrollController.addListener(setScrollListener);
  }

  void setScrollListener() {
    if (scrollController.offset >
            scrollController.position.maxScrollExtent - 80.0 &&
        bloc.state.canLoadMore &&
        !bloc.state.status.isLoading) {
      bloc.load();
    }
  }

  @override
  void initState() {
    assert(
      () {
        try {
          BlocProvider.of<SliverListCubit>(context);
          return true;
        } catch (_) {
          return false;
        }
      }(),
      'Could not find correct BlocProvider<PaginationCubit<${ModelClass.toString()}>>. Are your types correct?',
    );
    setScrollController();
    super.initState();
  }

  @override
  void didUpdateWidget(
    covariant PaginationSliverList<SliverListCubit, ModelClass> oldWidget,
  ) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      scrollController.dispose();
      setScrollController();
    }
  }

  @override
  void didChangeDependencies() {
    bloc = BlocProvider.of<SliverListCubit>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SliverListCubit, PaginationState<ModelClass>>(
      listener: (ctx, state) {
        widget.cubitListener?.call(ctx, state);
      },
      builder: (ctx, state) {
        if (state.items.isEmpty) {
          if (state.status.isInitial) {
            final builder = widget.emptyInitSliver;
            if (builder != null) return builder(ctx, state);
            return const SliverToBoxAdapter(child: _DefaultEmptyInitWidget());
          } else if (state.status.isLoading) {
            final builder = widget.emptyLoadingSliver;
            if (builder != null) return builder(ctx, state);
            return const SliverToBoxAdapter(
              child: _DefaultEmptyLoadingWidget(),
            );
          } else if (state.status.isFailure) {
            final builder = widget.emptyFailureSliver;
            if (builder != null) return builder(ctx, state);
            return const SliverToBoxAdapter(child: _DefaultFailureWidget());
          } else {
            final builder = widget.emptySuccessSliver;
            if (builder != null) return builder(ctx, state);
            return const SliverToBoxAdapter(
              child: _DefaultEmptySuccessWidget(),
            );
          }
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                if (index == state.items.length) {
                  if (state.status.isLoading) {
                    final builder = widget.trailingLoading;
                    if (builder != null) return builder(ctx, state);
                    return const _DefaultTrailingLoadingWidget();
                  } else if (state.status.isFailure) {
                    final builder = widget.trailingFailure;
                    if (builder != null) return builder(ctx, state);
                    return const _DefaultFailureWidget();
                  } else {
                    if (!state.canLoadMore) {
                      final builder = widget.trailingNoMoreItems;
                      if (builder != null) return builder(ctx, state);
                      return const _DefaultNoMoreItemsWidget();
                    }
                  }
                } else {
                  return widget.itemBuilder(ctx, state, index);
                }
                return null;
              },
              childCount: state.items.length + 1,
            ),
          );
        }
      },
    );
  }
}*/

class _DefaultEmptyLoadingWidget extends StatelessWidget {
  const _DefaultEmptyLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _DefaultTrailingLoadingWidget extends StatelessWidget {
  const _DefaultTrailingLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: CircularProgressIndicator(),
    );
  }
}

class _DefaultFailureWidget extends StatelessWidget {
  const _DefaultFailureWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Произошла ошибка'));
  }
}

class _DefaultEmptySuccessWidget extends StatelessWidget {
  const _DefaultEmptySuccessWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Список пуст'));
  }
}

class _DefaultNoMoreItemsWidget extends StatelessWidget {
  const _DefaultNoMoreItemsWidget();

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
