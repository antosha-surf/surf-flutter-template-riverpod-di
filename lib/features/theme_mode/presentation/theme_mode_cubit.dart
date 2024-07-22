import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:architalk/features/theme_mode/domain/repositories/i_theme_mode_repository.dart';
import 'package:architalk/features/theme_mode/presentation/presentation.dart';

/// Cubit-based implementation of [IThemeModeController].
final class ThemeModeCubit extends Cubit<ThemeMode>
    implements IThemeModeController {
  /// @nodoc.
  ThemeModeCubit({
    required IThemeModeRepository repo,
  })  : _repo = repo,
        super(repo.currentThemeMode.value);

  /// ThemeModeRepository.
  final IThemeModeRepository _repo;

  @override
  ValueListenable<ThemeMode> get themeMode => _repo.currentThemeMode;

  @override
  Future<void> close() {
    _repo.dispose();
    return super.close();
  }

  @override
  Future<void> setThemeMode(ThemeMode theme) async {
    await _repo.setThemeMode(theme);
    emit(theme);
  }

  @override
  Future<void> switchThemeMode() async {
    final newThemeMode = switch (state) {
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.system => ThemeMode.system,
    };

    await _repo.setThemeMode(newThemeMode);
    emit(newThemeMode);
  }
}
