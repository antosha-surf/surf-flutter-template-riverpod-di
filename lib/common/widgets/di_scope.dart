import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as rp;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as pr;
import 'package:architalk/features/app/domain/app_scope.dart';

/// Di container. T - return type(for example [AppScope]).
class DiScope<T> extends SingleChildStatelessWidget {
  /// Create an instance [DiScope].
  const DiScope({
    required this.provider,
    super.key,
    super.child,
  });

  /// A riverpod Provider that creates the scope.
  final rp.AutoDisposeProvider<T> provider;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return rp.Consumer(
      builder: (ctx, ref, child) {
        return pr.Provider<T>.value(
          value: ref.watch(provider),
          child: child,
        );
      },
      child: child,
    );
  }
}
