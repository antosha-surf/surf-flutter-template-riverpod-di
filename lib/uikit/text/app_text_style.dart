//ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

const _baseFontFamily = 'YS_Text';

/// App text style.
enum AppTextStyle {
  caption(
    TextStyle(
      fontFamily: _baseFontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 16 / 11,
    ),
  ),
  body(
    TextStyle(
      fontFamily: _baseFontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
    ),
  ),
  title(
    TextStyle(
      fontFamily: _baseFontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 28 / 24,
    ),
  ),
  ;

  final TextStyle value;

  const AppTextStyle(this.value);
}
