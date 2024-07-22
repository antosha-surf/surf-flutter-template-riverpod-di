import 'package:flutter/material.dart';
import 'package:architalk/common/utils/disposable_object/i_disposable_object.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';

/// Theme mode repository.
abstract interface class IThemeModeRepository implements IDisposableObject {
  /// Get current theme mode.
  ValueNotifier<ThemeMode> get currentThemeMode;

  /// Set theme mode.
  RequestOperation<void> setThemeMode(ThemeMode newThemeMode);
}
