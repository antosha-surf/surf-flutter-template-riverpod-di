import 'package:flutter/material.dart';
import 'package:architalk/l10n/app_localizations.g.dart';

/// Mixin for BuildContext which provides localization.
mixin ILocalizationMixin on BuildContext {
  /// Localizations instance.
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
