import 'package:architalk/common/utils/utils.dart';
import 'package:architalk/features/home/data/home_info_repository.dart';
import 'package:architalk/features/home/domain/home_info_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _homeScopeProvider = Provider.autoDispose<IHomeScope>((ref) {
  final scope = HomeScope(
    homeInfoRepository: HomeInfoRepositoryImpl(),
  );

  ref.onDispose(() {
    scope.dispose();
  });

  return scope;
});

class HomeScope implements IHomeScope, IDisposableObject {
  @override
  final IHomeInfoRepository homeInfoRepository;

  const HomeScope({
    required this.homeInfoRepository,
  });

  @override
  void dispose() {
    homeInfoRepository.dispose();
  }
}

abstract interface class IHomeScope {
  static final provider = _homeScopeProvider;

  IHomeInfoRepository get homeInfoRepository;
}
