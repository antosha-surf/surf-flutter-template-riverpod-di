// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';
import 'package:architalk/uikit/colors/color_palette.dart';

/// App brand color scheme.
///
/// Use case:
///
/// ```dart
/// final colorScheme = AppColorScheme.of(context);
///
/// return Container(color: colorScheme.primary);
/// ```
@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// @nodoc.
  final Color textPrimary;

  /// @nodoc.
  final Color textSecondary;

  /// @nodoc.
  final Color textInversePrimary;

  /// @nodoc.
  final Color textInverseSecondary;

  /// @nodoc.
  final Color controlPrimary;

  /// @nodoc.
  final Color controlSecondary;

  /// @nodoc.
  final Color borderPrimary;

  /// @nodoc.
  final Color borderSecondary;

  /// @nodoc.
  final Color surface;

  /// @nodoc.
  final Color specialError;

  /// @nodoc.
  final Color specialLink;

  /// Background color for things like scroll view background.
  final Color background;

  /// Divider color.
  final Color divider;

  /// Badge color.
  final Color badge;

  /// Base light theme version.
  AppColorScheme.light()
      : textPrimary = ColorPalette.black.withOpacity(.9),
        textSecondary = ColorPalette.black.withOpacity(.6),
        textInversePrimary = ColorPalette.white,
        textInverseSecondary = ColorPalette.white.withOpacity(.6),
        controlPrimary = ColorPalette.charlestonGreen,
        controlSecondary = ColorPalette.black.withOpacity(.05),
        borderPrimary = ColorPalette.darkCharcoal,
        borderSecondary = ColorPalette.black.withOpacity(.15),
        specialError = ColorPalette.carminePink,
        specialLink = ColorPalette.brightNavyBlue,
        background = ColorPalette.cultured,
        divider = ColorPalette.cadetGrey.withOpacity(.24),
        surface = ColorPalette.antiFlashWhiteDark,
        badge = ColorPalette.venetianRed;

  /// Base dark theme version.
  AppColorScheme.dark()
      : textPrimary = ColorPalette.black.withOpacity(.9),
        textSecondary = ColorPalette.black.withOpacity(.6),
        textInversePrimary = ColorPalette.white,
        textInverseSecondary = ColorPalette.white.withOpacity(.6),
        controlPrimary = ColorPalette.charlestonGreen,
        controlSecondary = ColorPalette.black.withOpacity(.05),
        borderPrimary = ColorPalette.darkCharcoal,
        borderSecondary = ColorPalette.black.withOpacity(.15),
        specialError = ColorPalette.carminePink,
        specialLink = ColorPalette.brightNavyBlue,
        background = ColorPalette.cultured,
        divider = ColorPalette.cadetGrey.withOpacity(.24),
        surface = ColorPalette.antiFlashWhiteDark,
        badge = ColorPalette.venetianRed;

  const AppColorScheme._({
    required this.textPrimary,
    required this.textSecondary,
    required this.textInversePrimary,
    required this.textInverseSecondary,
    required this.controlPrimary,
    required this.controlSecondary,
    required this.borderPrimary,
    required this.borderSecondary,
    required this.specialError,
    required this.specialLink,
    required this.background,
    required this.divider,
    required this.surface,
    required this.badge,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textInversePrimary,
    Color? textInverseSecondary,
    Color? textInverseTertiary,
    Color? controlPrimary,
    Color? controlSecondary,
    Color? controlSecondaryContrast,
    Color? controlDisabled,
    Color? controlPrimaryHover,
    Color? controlSecondaryHover,
    Color? borderPrimary,
    Color? borderSecondary,
    Color? borderSecondaryContrast,
    Color? borderTertiary,
    Color? surface0,
    Color? surface100,
    Color? surface200,
    Color? specialOverlay,
    Color? specialError,
    Color? specialLink,
    Color? background,
    Color? divider,
    Color? surface,
    Color? badge,
  }) {
    return AppColorScheme._(
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textInversePrimary: textInversePrimary ?? this.textInversePrimary,
      textInverseSecondary: textInverseSecondary ?? this.textInverseSecondary,
      controlPrimary: controlPrimary ?? this.controlPrimary,
      controlSecondary: controlSecondary ?? this.controlSecondary,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      specialError: specialError ?? this.specialError,
      specialLink: specialLink ?? this.specialLink,
      background: background ?? this.background,
      divider: divider ?? this.divider,
      surface: surface ?? this.surface,
      badge: badge ?? this.badge,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    if (t == 0.0) {
      return this;
    }

    if (t == 1.0) {
      return other;
    }

    return AppColorScheme._(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textInversePrimary:
          Color.lerp(textInversePrimary, other.textInversePrimary, t)!,
      textInverseSecondary:
          Color.lerp(textInverseSecondary, other.textInverseSecondary, t)!,
      controlPrimary: Color.lerp(controlPrimary, other.controlPrimary, t)!,
      controlSecondary:
          Color.lerp(controlSecondary, other.controlSecondary, t)!,
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t)!,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t)!,
      specialError: Color.lerp(specialError, other.specialError, t)!,
      specialLink: Color.lerp(specialLink, other.specialLink, t)!,
      background: Color.lerp(background, other.background, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      badge: Color.lerp(badge, other.badge, t)!,
    );
  }

  /// Returns [AppColorScheme] from [context].
  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
