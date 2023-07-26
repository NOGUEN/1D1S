import 'package:flutter/material.dart';

//앱 내 색을 정의하는 공간. 사용할 색 여기 정의해주세요
abstract class AppColors {
  static const Color black = Color(0xFF202021);
  static const Color white = Colors.white;

  static const Color pageBackground = Color(0xFFFAFAFA);
  static const Color cardBackground = Colors.white;

  static const Color primaryColor = Color.fromARGB(255, 255, 105, 105);

  static const Color gray100 = Color(0xFFF1F1F1);
  static const Color gray200 = Color(0xFFE2E2E2);
  static const Color gray300 = Color(0xFFD7D7D7);
  static const Color gray500 = Color(0xFF8B8B8B);
  static const Color gray700 = Color(0xFF454545);
  static const Color buttonGray = Color(0xFFF5F4F3);
  static const Color chatInputGray = Color(0xFFF6F6F6);
  static const Color messageHintGray = Color(0xFFC4C4C4);
}
