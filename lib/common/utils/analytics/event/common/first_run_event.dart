import 'package:architalk/common/utils/analytics/analytics_event_ids.dart';
import 'package:architalk/common/utils/analytics/base/analytic_event.dart';

/// Represents an event that occurs during the first launch of the app.
class FirstRunEvent implements AnalyticEvent {
  /// Returns the key associated with the event for analytics tracking.
  @override
  String get id => IdsAnalyticsEvents.firstRun.id;

  /// Returns a map of additional parameters associated with the event.
  @override
  Map<String, int> get params => {};

  /// Constructs a new instance of [FirstRunEvent].
  const FirstRunEvent();

  /// Returns a string representation of the event.
  @override
  String toString() => 'FirstRunEvent';
}
