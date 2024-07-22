import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:architalk/common/utils/utils.dart';
import 'package:architalk/persistence/persistence.dart';

/// An implementation of [ITokenStorage].
class TokenStorageImpl implements ITokenStorage, IDisposableObject {
  @override
  final ValueNotifier<TokenStorageState> currentlyStoredTokens;

  final ISecureStorage _secureStorage;

  /// @nodoc.
  TokenStorageImpl({
    required ISecureStorage secureStorage,
  })  : _secureStorage = secureStorage,
        currentlyStoredTokens = ValueNotifier(
          () {
            final fromStorage = secureStorage.read(
              TokenStorageKeys.tokenStorageState.keyName,
            );

            if (fromStorage == null) {
              return const TokenStorageState(
                tokens: [],
                currentlyUsedToken: null,
              );
            }

            return TokenStorageState.fromJson(jsonDecode(fromStorage));
          }(),
        );

  @override
  Future<void> addToken(String token) {
    if (currentlyStoredTokens.value.tokens.contains(token)) {
      return Future.value();
    }

    return _persistCopy(
      (state) => state.copyWith(
        tokens: [...state.tokens, token],
      ),
    );
  }

  @override
  Future<void> removeToken(String token) {
    return _persistCopy((state) {
      final newTokens = state.tokens.where((e) => e != token).toList();
      return state.copyWith(
        tokens: newTokens,
        currentlyUsedToken: newTokens.contains(state.currentlyUsedToken)
            ? state.currentlyUsedToken
            : null,
      );
    });
  }

  @override
  Future<void> setCurrentlyUsedToken(String? token) {
    return _persistCopy(
      (state) => state.copyWith(
        currentlyUsedToken: token,
      ),
    );
  }

  @override
  Future<void> addAndUseToken(String token) {
    if (currentlyStoredTokens.value.tokens.contains(token)) {
      return setCurrentlyUsedToken(token);
    }

    return _persistCopy(
      (state) => state.copyWith(
        tokens: [...state.tokens, token],
        currentlyUsedToken: token,
      ),
    );
  }

  @override
  void dispose() {
    currentlyStoredTokens.dispose();
  }

  Future<void> _persistCopy(
    TokenStorageState Function(TokenStorageState) copyFn,
  ) async {
    final currentState = currentlyStoredTokens.value;
    final newState = copyFn(currentState);
    await _secureStorage.write(
      TokenStorageKeys.tokenStorageState.keyName,
      jsonEncode(newState.toJson()),
    );
    currentlyStoredTokens.value = newState;
  }
}

/// Keys for [TokenStorageImpl].
enum TokenStorageKeys {
  /// Currently used token.
  tokenStorageState('token_storage_state');

  /// Key Name.
  final String keyName;

  const TokenStorageKeys(this.keyName);
}
