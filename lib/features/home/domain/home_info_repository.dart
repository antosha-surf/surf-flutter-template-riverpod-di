import 'package:flutter/foundation.dart';

abstract interface class IHomeInfoRepository {
  ValueListenable<String> get currentHomeInfo;

  Future<void> updateHomeInfo(String newInfo);

  void dispose();
}
