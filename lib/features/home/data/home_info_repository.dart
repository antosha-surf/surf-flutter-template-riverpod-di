import 'dart:async';

import 'package:architalk/common/utils/utils.dart';
import 'package:architalk/features/home/domain/home_info_repository.dart';
import 'package:flutter/foundation.dart';

class HomeInfoRepositoryImpl implements IHomeInfoRepository, IDisposableObject {
  @override
  final ValueNotifier<String> currentHomeInfo;

  HomeInfoRepositoryImpl() : currentHomeInfo = ValueNotifier<String>('initial');

  @override
  Future<void> updateHomeInfo(String newInfo) async {
    await Future.delayed(const Duration(seconds: 1));
    currentHomeInfo.value = newInfo;
  }

  @override
  void dispose() {
    currentHomeInfo.dispose();
  }
}
