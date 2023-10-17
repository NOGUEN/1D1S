import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//app_theme이외의 텍스트 스타일이 필요할 때 여기 정의해주세요
const TextStyle appTitleTextStyle = TextStyle(
  color: AppColors.black,
  fontSize: 24,
  fontWeight: AppFontWeights.heavy,
);

const TextStyle inputHintTextStyle = TextStyle(
  color: AppColors.gray500,
  fontSize: 20,
  fontWeight: AppFontWeights.regular,
);

TextStyle inputGoalAddHintTextStyle = TextStyle(
  color: AppColors.black,
  fontSize: 20.sp,
  fontWeight: AppFontWeights.extrabold,
);
const TextStyle inputGoalAddConfirmTextStyle = TextStyle(
  color: Colors.blue,
  fontSize: 18,
  fontWeight: AppFontWeights.bold,
);
TextStyle RecordAddConfirmTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.sp,
  fontWeight: AppFontWeights.extrabold,
);
TextStyle RecordAddInputContentHintTextStyle = TextStyle(
  color: Color(0xFFB1B1B1),
  fontSize: 16.sp,
  fontWeight: AppFontWeights.extrabold,
);
TextStyle RecordAddDropdownTextStyle = TextStyle(
  color: AppColors.black,
  fontSize: 24.sp,
  fontWeight: AppFontWeights.heavy,
);
TextStyle RecordAddDropdownSelectedItemTextStyle = TextStyle(
  color: AppColors.white,
  fontSize: 24.sp,
  fontWeight: AppFontWeights.heavy,
);
const TextStyle inputContentTextStyle = TextStyle(
  color: AppColors.black,
  fontSize: 20,
  fontWeight: AppFontWeights.regular,
);

const TextStyle subButtonTextStyle = TextStyle(
  color: AppColors.black,
  fontSize: 20,
  fontWeight: AppFontWeights.regular,
);

const TextStyle labelTextStyle = TextStyle(
  color: AppColors.black,
  fontSize: 15,
  fontWeight: AppFontWeights.regular,
);

const TextStyle head1 = TextStyle(
  color: AppColors.black,
  fontSize: 30,
  fontWeight: AppFontWeights.bold,
);

const TextStyle head2 = TextStyle(
  color: AppColors.black,
  fontSize: 24,
  fontWeight: AppFontWeights.bold,
);

const TextStyle head3 = TextStyle(
  color: AppColors.black,
  fontSize: 18,
  fontWeight: AppFontWeights.bold,
);

TextStyle trackCardHead = TextStyle(
  color: AppColors.white,
  fontSize: 18.sp,
  fontWeight: AppFontWeights.heavy,
);

const TextStyle trackCardContent = TextStyle(
  color: AppColors.white,
  fontSize: 18,
  fontWeight: AppFontWeights.bold,
);

TextStyle trackCardProfile = TextStyle(
  color: AppColors.white,
  fontSize: 16.sp,
  fontWeight: AppFontWeights.medium,
);


TextStyle goalCardmainTitle = TextStyle(
  color: AppColors.white,
  fontSize: 24.sp,
  fontWeight: AppFontWeights.bold,
);

TextStyle goalCardsubTitle = TextStyle(
  color: AppColors.white,
  fontSize: 16.sp,
  fontWeight: AppFontWeights.bold,
);
TextStyle goalCardconsecutive = TextStyle(
  color: AppColors.white,
  fontSize: 35.sp,
  fontWeight: AppFontWeights.bold,
);
TextStyle goalNewcardDialog = TextStyle(
  color: AppColors.black,
  fontSize: 24.sp,
  fontWeight: AppFontWeights.extrabold,
);
TextStyle profileCardHead = TextStyle(
  color: AppColors.black,
  fontSize: 30.sp,
  fontWeight: AppFontWeights.bold,
);

TextStyle profileCardRecordHead = TextStyle(
  color: AppColors.black,
  fontSize: 16.sp,
  fontWeight: AppFontWeights.regular,
);

TextStyle profileCardRecordContent = TextStyle(
  color: AppColors.black,
  fontSize: 16.sp,
  fontWeight: AppFontWeights.bold,
);

TextStyle profileCardAboutMeHead = TextStyle(
  color: AppColors.black,
  fontSize: 20.sp,
  fontWeight: AppFontWeights.bold,
);

TextStyle profileCardAboutMeContent = TextStyle(
  color: AppColors.black,
  fontSize: 20.sp,
  fontWeight: AppFontWeights.regular,
);

const TextStyle everyoneSGoalButtonTextStyle = TextStyle(
  color: AppColors.black,
  fontSize: 25,
  fontWeight: AppFontWeights.bold,
);

TextStyle goalListAddRecordButton = TextStyle(
  color: AppColors.white,
  fontSize: 16.sp,
  fontWeight: AppFontWeights.bold,
);
TextStyle goalListAddRecordButtonIcon = TextStyle(
  color: AppColors.white,
  fontSize: 24.sp,
  fontWeight: AppFontWeights.bold,
  height: 1.sp
);
TextStyle goalListHead = TextStyle(
  color: AppColors.white,
  fontSize: 24.sp,
  fontWeight: AppFontWeights.bold,
);
TextStyle goalListStackDay = TextStyle(
  color: AppColors.white,
  fontSize: 20.sp,
  fontWeight: AppFontWeights.bold,
);