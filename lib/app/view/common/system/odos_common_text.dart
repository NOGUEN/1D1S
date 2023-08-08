import 'package:flutter/material.dart';

import '../../theme/app_string.dart';

class ODOSCommonText extends StatelessWidget {
  final String text;
  final String textKey;
  final Color textColor;
  const ODOSCommonText({
    super.key,
    required this.text,
    required this.textKey,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
        fontSize: textMap[textKey]![0],
        height: textMap[textKey]![1] / textMap[textKey]![0],
        fontWeight: textMap[textKey]![2],
      ),
    );
  }
}

//텍스트 Map => 0 : 사이즈, 1 : line-height, 2 : weight
Map<String, List<dynamic>> textMap = {
  //regular
  AppString.regular12: [12.0, 16.0, FontWeight.w400],
  AppString.regular14: [14.0, 20.0, FontWeight.w400],
  AppString.regular16: [16.0, 24.0, FontWeight.w400],
  AppString.regular20: [20.0, 28.0, FontWeight.w400],

  //medium
  AppString.medium16: [16.0, 24.0, FontWeight.w500],

  //bold
  AppString.bold14: [14.0, 20.0, FontWeight.w700],
  AppString.bold16: [16.0, 24.0, FontWeight.w700],
  AppString.bold20: [20.0, 28.0, FontWeight.w700],
  AppString.bold24: [24.0, 32.0, FontWeight.w700],
};
