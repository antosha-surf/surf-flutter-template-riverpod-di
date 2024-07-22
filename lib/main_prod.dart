import 'package:architalk/config/environment/build_type.dart';
import 'package:architalk/config/environment/environment.dart';
import 'package:architalk/runner.dart';

/// Main entry point of app.
void main() {
  run(const Environment(buildType: BuildType.prod)).ignore();
}
