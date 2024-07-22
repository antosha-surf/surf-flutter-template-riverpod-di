import 'package:analytics/analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:surf_logger/surf_logger.dart' as surf_logger;
import 'package:architalk/common/common.dart';
import 'package:architalk/common/utils/logger/logger.dart';
import 'package:architalk/config/app_config.dart';
import 'package:architalk/config/environment/environment.dart';
import 'package:architalk/features/app/data/dio/dio_internet_connection_interceptor.dart';
import 'package:architalk/features/app/domain/app_scope.dart';
import 'package:architalk/features/storage/storage.dart';
import 'package:architalk/persistence/persistence.dart';

/// A class to hold creation logic of [AppScope].
class AppScopeCreator {
  /// Create a default instance of [AppScope].
  static AppScope createBaseAppScope(
    Environment env,
    ISecureStorage secureStorage,
  ) {
    final appStorageScope = AppStorageScope(
      secureStorage: secureStorage,
      tokenStorage: TokenStorageImpl(
        secureStorage: secureStorage,
      ),
      firstRunStorage: FirstRunStorage(
        secureStorage: secureStorage,
      ),
      themeModeStorage: ThemeModeStorage(
        secureStorage: secureStorage,
      ),
    );

    return AppScope(
      env: env,
      appConfig: AppConfig(
        url: env.buildType.defaultUrl,
        isE2ETest: false,
      ),
      storage: appStorageScope,
      dio: DioCreator.createDioInstance(
        baseUrl: env.buildType.defaultUrl.value,
        interceptors: [
          NoInternetConnectionInterceptor(),
        ],
      ),
      logger: AppLogWriter(
        surf_logger.Logger.withStrategies({
          if (!kReleaseMode)
            DebugLogStrategy(
              Logger(
                printer: PrettyPrinter(methodCount: 0),
              ),
            ),
        }),
      ),
      analyticsService: AnalyticService.withStrategies({
        /* Add your strategies here */
      }),
    );
  }
}
