import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';
import 'package:architalk/features/app/domain/app_scope.dart';
import 'package:architalk/features/landing/domain/domain.dart';
import 'package:architalk/persistence/storage/storage.dart';
import 'package:architalk/util/util.dart';

/// Implementation of [ILandingRedirectRepository].
class LandingRedirectRepository implements ILandingRedirectRepository {
  final ITokenStorage _tokenStorage;

  /// @nodoc.
  const LandingRedirectRepository({
    required ITokenStorage tokenStorage,
  }) : _tokenStorage = tokenStorage;

  @override
  RequestOperation<RedirectToPage> getRedirectPage() async {
    return ErrorHandler.handle(() async {
      // final token =
      //     _tokenStorage.currentlyStoredTokens.value.currentlyUsedToken;
      //
      // if (token == null) {
      //   return RedirectToPage.auth;
      // }

      return RedirectToPage.main;
    });
  }
}
