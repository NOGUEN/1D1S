import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

class ODOSConfirmButton extends StatelessWidget {
  final Color buttonColor;

  const ODOSConfirmButton({
    required this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: AppValues.buttonHeight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: const Text(
          "확인",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
