import 'package:hive/hive.dart';

/// {@template flutter_secure_storage_provider}
/// Will give you an instance of Hive [Box].
/// {@endtemplate}
class SecureStorage implements ISecureStorage {
  final Box _box;

  /// @nodoc.
  const SecureStorage(this._box);

  @override
  String? read(String key) => _box.get(key) as String?;

  @override
  Future<void> write(String key, String value) => _box.put(key, value);

  @override
  Future<void> delete(String key) => _box.delete(key);

  @override
  Future<void> deleteAll() => _box.clear();
}

/// {@template secure_storage_interface}
/// Interface for basic string-only (fool-proof) secure storage.
/// {@endtemplate
abstract interface class ISecureStorage {
  /// Write a value to the storage.
  Future<void> write(String key, String value);

  /// Read a value from the storage.
  String? read(String key);

  /// Delete a value from the storage.
  Future<void> delete(String key);

  /// Delete all values from the storage.
  Future<void> deleteAll();
}
