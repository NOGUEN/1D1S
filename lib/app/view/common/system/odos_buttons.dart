import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/common/system/odos_common_text.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

class ODOSConfirmButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String buttonText;
  final GestureTapCallback onPressed;

  const ODOSConfirmButton({
    required this.buttonColor,
    required this.textColor,
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: AppValues.buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(AppColors.black),
          elevation: MaterialStateProperty.all(0.0),
        ),
        child: ODOSCommonText(
          text: buttonText,
          textKey: AppString.regular20,
          textColor: AppColors.white,
        ),
      ),
    );
  }
}

class ODOSSubButton extends StatelessWidget {
  const ODOSSubButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        elevation: MaterialStateProperty.all(0.0),
      ),
      child: const Text(
        "Text >",
        style: subButtonTextStyle,
      ),
    );
  }
}
