import 'package:flutter/foundation.dart';
import 'package:architalk/persistence/storage/storage.dart';

/// Interface for auth token storage.
abstract interface class ITokenStorage {
  /// A listenable of snapshots of currently stored tokens.
  ValueNotifier<TokenStorageState> get currentlyStoredTokens;

  /// Adds a new token to the storage.
  Future<void> addToken(String token);

  /// Removes a token from the storage.
  Future<void> removeToken(String token);

  /// Sets a token as currently used.
  /// Basically a simple logout when null.
  Future<void> setCurrentlyUsedToken(String? token);

  /// Adds a token to the storage and sets it as currently used.
  Future<void> addAndUseToken(String token);
}
