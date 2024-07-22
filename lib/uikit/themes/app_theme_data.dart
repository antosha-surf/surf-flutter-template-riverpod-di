import 'package:flutter/material.dart';

import 'package:architalk/uikit/colors/app_color_scheme.dart';
import 'package:architalk/uikit/text/app_text_scheme.dart';

/// Class of the app themes data.
abstract class AppThemeData {
  /// Light theme configuration.
  // todo
  static final lightTheme = ThemeData(
    extensions: [_lightColorScheme, _textScheme],
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightColorScheme.background,
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: _lightColorScheme.textSecondary.withOpacity(0.6),
      labelStyle: _textScheme.body,
      unselectedLabelStyle: _textScheme.body,
      labelColor: _lightColorScheme.textPrimary.withOpacity(0.9),
    ),
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle()),
  );

  /// Dark theme configuration.
  static final darkTheme = ThemeData(
    extensions: [_darkColorScheme, _textScheme],
    brightness: Brightness.dark,
    scaffoldBackgroundColor: _lightColorScheme.background,
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle()),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: TextStyle(
        color: _lightColorScheme.textInversePrimary,
      ),
    ),
  );

  static final _lightColorScheme = AppColorScheme.light();
  static final _darkColorScheme = AppColorScheme.dark();
  static final _textScheme = AppTextScheme.base();
}
