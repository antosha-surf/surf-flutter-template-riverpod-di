import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:architalk/persistence/low_level/secure_storage.dart';
import 'package:architalk/persistence/storage/theme_storage/i_theme_mode_storage.dart';

/// Persistent storage for theme mode.
///
/// Based on SharedPreferences.
class ThemeModeStorage implements IThemeModeStorage {
  final ISecureStorage _secureStorage;

  /// Create an instance [ThemeModeStorage].
  const ThemeModeStorage({
    required ISecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  @override
  ThemeMode? getThemeMode() {
    final themeName = _secureStorage.read(ThemeStorageKeys.mode.keyName);
    if (themeName?.isEmpty ?? true) return null;

    return ThemeMode.values.firstWhereOrNull((e) => e.name == themeName);
  }

  @override
  Future<void> saveThemeMode({required ThemeMode mode}) {
    return _secureStorage.write(ThemeStorageKeys.mode.keyName, mode.name);
  }
}

/// Keys for [ThemeModeStorage].
enum ThemeStorageKeys {
  /// Theme mode.
  mode('theme_mode');

  /// Key Name.
  final String keyName;

  const ThemeStorageKeys(this.keyName);
}
