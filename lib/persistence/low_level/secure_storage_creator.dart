import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:architalk/persistence/low_level/secure_storage.dart';

/// A class to hold creation logic of [SecureStorage].
class SecureStorageCreator {
  /// Create a new instance of [SecureStorage].
  static Future<SecureStorage> createDefaultSecureStorage() async {
    Hive.init((await getApplicationCacheDirectory()).absolute.path);
    return SecureStorage(await Hive.openBox('your_apps_secure_storage'));
  }
}
