import 'package:riverpod/riverpod.dart';
import 'package:architalk/common/utils/disposable_object/disposable_object.dart';
import 'package:architalk/common/utils/disposable_object/i_disposable_object.dart';
import 'package:architalk/features/app/domain/app_scope.dart';
import 'package:architalk/features/theme_mode/data/repositories/theme_mode_repository.dart';
import 'package:architalk/features/theme_mode/domain/repositories/i_theme_mode_repository.dart';

final _themeModeScopeProvider = Provider.autoDispose<IThemeModeScope>((ref) {
  return ThemeModeScope(
    ThemeModeRepository(
      themeModeStorage: ref.read(AppScope.provider).storage.themeModeStorage,
    ),
  );
});

/// {@template theme_scope.class}
/// Implementation of [IThemeModeScope].
/// {@endtemplate}
final class ThemeModeScope extends DisposableObject implements IThemeModeScope {
  @override
  final IThemeModeRepository repository;

  /// {@macro theme_scope.class}
  ThemeModeScope(this.repository);
}

/// Scope dependencies of the Theme feature.
abstract interface class IThemeModeScope implements IDisposableObject {
  /// A provider for [ThemeModeScope].
  static final provider = _themeModeScopeProvider;

  /// ThemeRepository.
  IThemeModeRepository get repository;
}
