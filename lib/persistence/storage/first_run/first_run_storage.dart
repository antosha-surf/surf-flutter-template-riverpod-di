import 'package:architalk/persistence/low_level/secure_storage.dart';
import 'package:architalk/persistence/storage/first_run/i_first_run_storage.dart';

/// {@template first_run_storage.class}
/// Repository for working with first run status.
/// {@endtemplate}
class FirstRunStorage implements IFirstRunStorage {
  final ISecureStorage _secureStorage;

  /// Create an instance [FirstRunStorage].
  const FirstRunStorage({
    required ISecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  @override
  bool getIsFirstRun() {
    final value = _secureStorage.read(FirstRunStorageKeys.firstRun.keyName);
    return value == null || value == true.toString();
  }

  @override
  Future<void> setIsFirstRun({required bool value}) {
    return _secureStorage.write(
      FirstRunStorageKeys.firstRun.keyName,
      value.toString(),
    );
  }
}

/// Keys for [FirstRunStorage].
enum FirstRunStorageKeys {
  /// @nodoc.
  firstRun('first_run');

  /// Key Name.
  final String keyName;

  const FirstRunStorageKeys(this.keyName);
}
