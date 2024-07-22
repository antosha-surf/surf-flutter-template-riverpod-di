import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:architalk/config/environment/environment.dart';
import 'package:architalk/features/app/app_wrapper.dart';
import 'package:architalk/features/app/domain/app_scope.dart';
import 'package:architalk/features/app/domain/app_scope_creator.dart';
import 'package:architalk/persistence/low_level/secure_storage_creator.dart';

/// App launch.
Future<void> run(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();

  final fbOptions = env.firebaseOptions;

  if (fbOptions != null) {
    await Firebase.initializeApp(options: fbOptions);
  }

  // TODO(init-project): Initialize Crashlytics.

  // TODO(init-project): Change as needed or remove.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  _runWithAppScope(
    AppScopeCreator.createBaseAppScope(
      env,
      await SecureStorageCreator.createDefaultSecureStorage(),
    ),
  );
}

void _runWithAppScope(AppScope appScope) {
  runApp(
    AppWrapper(
      diOverrides: [
        AppScope.provider.overrideWithValue(appScope),
      ],
    ),
  );
}

// ignore: unused_element
void _setupCrashlytics() {
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance
        .recordError(error, stack, fatal: true)
        .ignore();

    return true;
  };
}
