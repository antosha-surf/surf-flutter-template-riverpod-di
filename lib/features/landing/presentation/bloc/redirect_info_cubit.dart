import 'package:architalk/common/bloc/bloc.dart';
import 'package:architalk/common/utils/logger/i_log_writer.dart';
import 'package:architalk/core/architecture/domain/entities/entities.dart';
import 'package:architalk/core/architecture/presentation/base_bloc.dart';
import 'package:architalk/features/landing/domain/domain.dart';

/// Cubit for encapsulating redirect logic to outside of UI.
class RedirectInfoCubit extends SingleActionCubit<RedirectToPage>
    with BlocCoverage {
  final ILandingRedirectRepository _repo;

  @override
  ILogWriter? get logWriter => null;

  /// @nodoc.
  RedirectInfoCubit({
    required ILandingRedirectRepository repo,
  }) : _repo = repo;

  @override
  RequestOperation<RedirectToPage> action() {
    return runWithCoverage(_repo.getRedirectPage);
  }
}
