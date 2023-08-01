import 'package:flutter/material.dart';
import 'app_colors.dart';

// 앱 내 테마 정의하는 공간. 색/폰트/텍스트 스타일은 여기 정의해주세요
final ThemeData appThemeData = ThemeData(
  primaryColor: AppColors.primaryColor,
  highlightColor: Colors.transparent,
  fontFamily: 'SUITE',
  splashColor: Colors.transparent,
  hoverColor: Colors.transparent,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
  ),
);
