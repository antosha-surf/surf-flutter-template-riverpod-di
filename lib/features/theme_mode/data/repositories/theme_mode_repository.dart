import 'package:flutter/material.dart';
import 'package:architalk/common/utils/disposable_object/disposable_object.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';
import 'package:architalk/features/theme_mode/domain/repositories/i_theme_mode_repository.dart';
import 'package:architalk/persistence/storage/theme_storage/i_theme_mode_storage.dart';

/// {@template theme_repository.class}
/// Implementation of [IThemeModeRepository].
/// {@endtemplate}
final class ThemeModeRepository extends DisposableObject
    implements IThemeModeRepository {
  @override
  final ValueNotifier<ThemeMode> currentThemeMode;

  final IThemeModeStorage _themeModeStorage;

  /// {@macro theme_repository.class}
  ThemeModeRepository({
    required IThemeModeStorage themeModeStorage,
  })  : _themeModeStorage = themeModeStorage,
        currentThemeMode = ValueNotifier<ThemeMode>(
          themeModeStorage.getThemeMode() ?? ThemeMode.light,
        );

  @override
  void dispose() {
    currentThemeMode.dispose();
    super.dispose();
  }

  @override
  RequestOperation<void> setThemeMode(ThemeMode newThemeMode) async {
    return Result.ok(await _themeModeStorage.saveThemeMode(mode: newThemeMode));
  }
}
