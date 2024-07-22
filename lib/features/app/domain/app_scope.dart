import 'package:analytics/analytics.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:architalk/common/utils/logger/logger.dart';
import 'package:architalk/config/app_config.dart';
import 'package:architalk/config/environment/environment.dart';
import 'package:architalk/features/storage/storage.dart';

part '../di/app_scope_provider.dart';

/// {@template app_scope.class}
/// Scope of dependencies which are needed throughout the whole app's life.
/// {@endtemplate}
final class AppScope {
  /// A provider for [AppScope].
  static final provider = _appScopeProvider;

  /// Environment.
  final Environment env;

  /// App configuration.
  final AppConfig appConfig;

  /// App storage scope.
  final AppStorageScope storage;

  /// Http client.
  final Dio dio;

  /// Analytics sending service.
  final AnalyticService analyticsService;

  /// Logger.
  final ILogWriter logger;

  /// {@macro app_scope.class}
  const AppScope({
    required this.env,
    required this.appConfig,
    required this.storage,
    required this.dio,
    required this.analyticsService,
    required this.logger,
  });
}
