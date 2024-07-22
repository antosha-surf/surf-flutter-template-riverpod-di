import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:architalk/common/widgets/di_scope.dart';
import 'package:architalk/features/theme_mode/di/theme_mode_scope.dart';
import 'package:architalk/features/theme_mode/presentation/presentation.dart';

/// {@template theme_listener.class}
/// Provides [IThemeModeController] to its descendants.
/// {@endtemplate}
class ThemeModeProvider extends SingleChildStatelessWidget {
  /// {@macro theme_listener.class}
  const ThemeModeProvider({super.key});

  /// Get the [IThemeModeController] from the [BuildContext].
  static IThemeModeController of(BuildContext context) =>
      Provider.of<IThemeModeController>(context, listen: false);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return DiScope<IThemeModeScope>(
      provider: IThemeModeScope.provider,
      child: Provider<IThemeModeController>(
        create: (ctx) => ThemeModeCubit(
          repo: ctx.read<IThemeModeScope>().repository,
        ),
        child: child,
      ),
    );
  }
}
