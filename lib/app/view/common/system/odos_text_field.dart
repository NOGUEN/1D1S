import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSTextField extends StatelessWidget {
  final TextEditingController controller;
  final String titleText;
  final String hintText;
  final TextInputAction? action;
  final TextInputType? inputType;
  final bool? needHide;
  void Function(String)? keyboardSubmit;
  void Function(String)? onChanged;

  ODOSTextField({
    required this.controller,
    required this.titleText,
    required this.hintText,
    this.action,
    this.inputType,
    this.needHide,
    this.keyboardSubmit,
    this.onChanged,
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
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class ODOSSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String titleText;
  final String hintText;
  final TextInputAction? action;
  final TextInputType? inputType;
  final bool? needHide;
  void Function(String)? keyboardSubmit;
  void Function(String)? onChanged;

  ODOSSearchTextField({
    required this.controller,
    required this.titleText,
    required this.hintText,
    this.action,
    this.inputType,
    this.needHide,
    this.keyboardSubmit,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.black,
          size: 24.h,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 184, 156, 156),
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
        contentPadding: EdgeInsets.fromLTRB(16.w, 10.h, 10.h, 0),
      ),
      style: inputContentTextStyle,
      textInputAction: action,
      keyboardType: inputType,
      obscureText: needHide != null && needHide! ? true : false,
      autofocus: false,
      onSubmitted: keyboardSubmit,
      onChanged: onChanged,
    );
  }
}
