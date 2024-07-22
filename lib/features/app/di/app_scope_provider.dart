part of '../domain/app_scope.dart';

/// Provider for [AppScope].
final _appScopeProvider = Provider.autoDispose<AppScope>((ref) {
  // Maybe provide a better error description here.
  throw Exception(
    'This provider must be overridden with a concrete implementation at app start',
  );
});
