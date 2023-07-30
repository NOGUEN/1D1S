import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSTextField extends StatelessWidget {
  const ODOSTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "이메일",
          style: labelTextStyle,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.gray300,
                width: 2,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.black,
                width: 4,
              ),
            ),
            hintText: "hint text",
            hintStyle: inputHintTextStyle,
            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          ),
          style: inputContentTextStyle,
        ),
      ],
    );
  }
}
