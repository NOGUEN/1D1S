import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSTextGaolField extends StatelessWidget {
  void Function(String)? onChanged;
  ODOSTextGaolField({this.onChanged,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.gray700,
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.black,
                    width: 1,
                  ),
                ),
                hintText: "제목",
                hintStyle: inputGoalAddHintTextStyle,
                contentPadding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              ),
              style: inputContentTextStyle,
              onChanged: onChanged,
            ),
          ],
        ));
  }
}
