import 'package:firebase_core/firebase_core.dart';
import 'package:architalk/config/environment/build_type.dart';
import 'package:architalk/config/url.dart';

/// {@template environment.class}
/// Environment configuration.
/// Only static configurations that are known at compile time are allowed here.
/// {@endtemplate}
class Environment {
  /// Build type.
  final BuildType buildType;

  /// Firebase options for initialize.
  final FirebaseOptions? firebaseOptions;

  /// Is this application running in dev mode.
  bool get isDev => buildType == BuildType.dev;

  /// Is this application running in prod mode.
  bool get isProd => buildType == BuildType.prod;

  /// {@macro environment.class}
  const Environment({
    required this.buildType,
    this.firebaseOptions,
  });
}

/// [BuildType] extension for default url.
extension BuildTypeX on BuildType {
  /// Default url for build type.
  ApiUrl get defaultUrl => switch (this) {
        BuildType.dev => ApiUrl.dev,
        BuildType.prod => ApiUrl.prod,
      };
}
