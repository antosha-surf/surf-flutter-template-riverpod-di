import 'package:architalk/features/app/domain/app_scope.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:architalk/common/utils/disposable_object/i_disposable_object.dart';
import 'package:architalk/features/landing/data/repositories/landing_redirect_repository.dart';
import 'package:architalk/features/landing/domain/domain.dart';

final _landingScopeProvider = Provider.autoDispose<ILandingScope>((ref) {
  final scope = LandingScope(
    landingRedirectRepository: LandingRedirectRepository(
      tokenStorage: ref.watch(AppScope.provider).storage.tokenStorage,
    ),
  );

  ref.onDispose(scope.dispose);

  return scope;
});

/// A scope for a landing page a.k.a "the '/' page" a.k.a where user ends up
/// when launching the app from closed (not in-background) state.
///
/// Landing page is where we decide what screen to send the user to.
abstract interface class ILandingScope {
  static final provider = _landingScopeProvider;

  /// A repository to get info on where to send the user.
  ILandingRedirectRepository get landingRedirectRepository;
}

/// Implementation of [ILandingScope].
class LandingScope implements ILandingScope, IDisposableObject {
  /// A provider for [LandingScope].
  static final provider = _landingScopeProvider;

  @override
  final ILandingRedirectRepository landingRedirectRepository;

  /// @nodoc.
  const LandingScope({
    required this.landingRedirectRepository,
  });

  @override
  void dispose() {
    print('LandingScope disposed.');
  }
}
