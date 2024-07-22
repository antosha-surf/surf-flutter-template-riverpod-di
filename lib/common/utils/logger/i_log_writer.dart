import 'package:architalk/core/architecture/domain/entities/entities.dart';

/// {@template i_log_writer.class}
/// SSOT (Single Source of Truth) for logging in the application.
/// {@endtemplate}
abstract interface class ILogWriter {
  /// Log message.
  void log(String message);

  /// Log exception.
  void exception(Object exception, [StackTrace? stackTrace]);

  /// Log failure.
  void failure(Failure failure);
}
