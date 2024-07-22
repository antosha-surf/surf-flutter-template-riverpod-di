import 'package:architalk/features/app/your_app_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as provider;
import 'package:architalk/common/widgets/di_scope.dart';
import 'package:architalk/features/app/domain/app_scope.dart';
import 'package:architalk/features/theme_mode/presentation/presentation.dart';
import 'package:architalk/navigation/app_router.dart';

/// {@template app_flow.class}
/// Entry point for the application.
/// {@endtemplate}
class AppWrapper extends StatelessWidget {
  /// {@macro app_flow.class}
  const AppWrapper({
    required this.diOverrides,
    super.key,
  });

  /// App scope.
  final List<riverpod.Override> diOverrides;

  @override
  Widget build(BuildContext context) {
    return riverpod.ProviderScope(
      overrides: diOverrides,
      child: Nested(
        child: const YourAppName(),
        children: [
          // Include AppScope provider as a proper DI.
          DiScope<AppScope>(provider: AppScope.provider),
          // Include AppRouter as UI-only DI.
          provider.ChangeNotifierProvider<AppRouter>(
            create: (_) => AppRouter(),
          ),
          // Include ThemeModeScope DI.
          const ThemeModeProvider(),
        ],
      ),
    );
  }
}
