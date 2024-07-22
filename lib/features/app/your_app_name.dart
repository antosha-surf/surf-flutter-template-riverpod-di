import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:architalk/features/app/domain/app_scope.dart';
import 'package:architalk/features/theme_mode/presentation/widgets/theme_mode_builder.dart';
import 'package:architalk/l10n/app_localizations.g.dart';
import 'package:architalk/navigation/app_router.dart';
import 'package:architalk/uikit/themes/app_theme_data.dart';

/// {@template app.class}
/// Application.
/// {@endtemplate}
class YourAppName extends StatelessWidget {
  /// {@macro app.class}
  const YourAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeModeBuilder(
      builder: (ctx, themeMode) {
        final appRouter = context.watch<AppRouter>();

        return MaterialApp.router(
          /// Navigation.
          routeInformationParser: appRouter.defaultRouteParser(),
          routerDelegate: appRouter.delegate(
            reevaluateListenable: context
                .watch<AppScope>()
                .storage
                .tokenStorage
                .currentlyStoredTokens,
          ),
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: themeMode,

          /// Wrapper for a screen.
          builder: (ctx, child) {
            final mediaQueryData = MediaQuery.of(ctx);

            // TODO(anyone): wrap this with snacks overlay when it's time.
            return MediaQuery(
              data: mediaQueryData.copyWith(textScaler: TextScaler.noScaling),
              child: child ?? const SizedBox(),
            );
          },

          /// Localization.
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _localizations,
        );
      },
    );
  }
}

const _localizations = [
  Locale('en', 'EN'),
  Locale('ru', 'RU'),
];

const _localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];
