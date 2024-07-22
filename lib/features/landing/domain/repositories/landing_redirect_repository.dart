import 'package:architalk/core/architecture/domain/entities/entities.dart';
import 'package:architalk/features/landing/domain/domain.dart';

/// A repository to get info on where to send the user.
// ignore: one_member_abstracts
abstract interface class ILandingRedirectRepository {
  /// Get the page to redirect the user to.
  RequestOperation<RedirectToPage> getRedirectPage();
}
