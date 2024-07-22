import 'package:analytics/analytics.dart';
import 'package:architalk/common/utils/analytics/base/has_id.dart';
import 'package:architalk/common/utils/analytics/base/has_map_params.dart';

/// Analytics event.
abstract class AnalyticEvent implements AnalyticAction, HasId, HasMapParams {}
