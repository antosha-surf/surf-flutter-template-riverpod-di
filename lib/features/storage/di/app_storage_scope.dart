import 'package:architalk/persistence/persistence.dart';
import 'package:architalk/persistence/storage/storage.dart';

/// A storage scope. Contains a collection of fine-grained storages.
class AppStorageScope {
  /// @nodoc.
  const AppStorageScope({
    required this.secureStorage,
    required this.firstRunStorage,
    required this.themeModeStorage,
    required this.tokenStorage,
  });

  /// Question mark. Should it be here?????
  final ISecureStorage secureStorage; // <----- read the docs above

  /// @nodoc.
  final IFirstRunStorage firstRunStorage;

  /// @nodoc.
  final IThemeModeStorage themeModeStorage;

  /// @nodoc.
  final ITokenStorage tokenStorage;
}
