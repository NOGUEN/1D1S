import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSTextField extends StatelessWidget {
  final TextEditingController controller;
  final String titleText;
  final String hintText;
  final TextInputAction? action;
  final TextInputType? inputType;
  final bool? needHide;
  final String? iconPath;
  void Function(String)? keyboardSubmit;
  final Function()? iconPressed;

  ODOSTextField({
    required this.controller,
    required this.titleText,
    required this.hintText,
    this.action,
    this.inputType,
    this.needHide,
    this.iconPath,
    this.keyboardSubmit,
    this.iconPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
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
            hintText: hintText,
            hintStyle: inputHintTextStyle,
            contentPadding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          ),
          style: inputContentTextStyle,
          textInputAction: action,
          keyboardType: inputType,
          obscureText: needHide != null && needHide! ? true : false,
          autofocus: false,
          onSubmitted: keyboardSubmit,
        ),
      ],
    );
  }
}
