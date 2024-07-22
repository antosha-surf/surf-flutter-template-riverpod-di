import 'package:architalk/config/url.dart';

/// {@template app_config.class}
/// Application configuration.
/// {@endtemplate}
class AppConfig {
  /// Server url.
  final ApiUrl url;

  /// True when the app is launched for e2e tests.
  final bool isE2ETest;

  // TODO(team): feature toggle should be added here.

  /// {@macro app_config.class}
  const AppConfig({
    required this.url,
    required this.isE2ETest,
  });
}
