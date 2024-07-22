import 'package:flutter/material.dart';

/// Converts hex string to material color. String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
Color colorfromHexString(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
