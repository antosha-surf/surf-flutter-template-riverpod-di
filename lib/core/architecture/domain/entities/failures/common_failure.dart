import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';

part 'common_failure.freezed.dart';

/// Common app failures.
@Freezed(copyWith: false)
class CommonFailure with _$CommonFailure implements Failure {
  @override
  Object? get original => null;

  @override
  StackTrace? get trace => null;

  const CommonFailure._();

  /// No internet connection failure.
  const factory CommonFailure.noInternet() = _NoInternet;

  /// Unknown failure.
  const factory CommonFailure.unknown() = _Unknown;
}
