// ignore_for_file: avoid-non-null-assertion, prefer-correct-callback-field-name
import 'package:flutter/material.dart';
import 'package:architalk/uikit/text/app_text_style.dart';

/// App text style scheme.
class AppTextScheme extends ThemeExtension<AppTextScheme> {
  final TextStyle headline;
  final TextStyle body;
  final TextStyle caption;

  const AppTextScheme._({
    required this.headline,
    required this.body,
    required this.caption,
  });

  /// Base app text theme.
  AppTextScheme.base()
      : headline = AppTextStyle.title.value,
        body = AppTextStyle.body.value,
        caption = AppTextStyle.caption.value;

  @override
  ThemeExtension<AppTextScheme> lerp(
    ThemeExtension<AppTextScheme>? other,
    double t,
  ) {
    if (other is! AppTextScheme) {
      return this;
    }

    if (t == 0.0) {
      return this;
    }

    if (t == 1.0) {
      return other;
    }

    return AppTextScheme._(
      headline: TextStyle.lerp(headline, other.headline, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
    );
  }

  /// Return text theme for app from context.
  static AppTextScheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextScheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  /// @nodoc.
  @override
  AppTextScheme copyWith({
    TextStyle? captionM,
    TextStyle? captionMMedium,
    TextStyle? bodyM,
    TextStyle? bodyMMedium,
    TextStyle? bodyS,
    TextStyle? bodySMedium,
    TextStyle? titleS,
    TextStyle? titleSMedium,
    TextStyle? titleM,
    TextStyle? titleMMedium,
    TextStyle? titleL,
    TextStyle? titleLMedium,
  }) {
    return AppTextScheme._(
      headline: headline,
      body: body,
      caption: caption,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
