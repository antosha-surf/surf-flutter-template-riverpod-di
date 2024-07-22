import 'package:flutter/material.dart';
import 'package:architalk/uikit/colors/app_color_scheme.dart';
import 'package:architalk/uikit/text/app_text_scheme.dart';

/// A mixin on BuildContext to get [AppColorScheme] and [AppTextScheme].
mixin ThemeIModelMixin on BuildContext {
  /// App color scheme.
  AppColorScheme get colorScheme => AppColorScheme.of(this);

  /// App text style scheme.
  AppTextScheme get textScheme => AppTextScheme.of(this);
}
