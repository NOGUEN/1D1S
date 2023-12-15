// ignore_for_file: camel_case_types

import 'package:one_day_one_something/app/view/common/goal/odos_fast_record_dropdown.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class recordDialogBox extends StatefulWidget {
  final String selectedGoalId;
  final List goalList;
  const recordDialogBox(
      {super.key, required this.selectedGoalId, required this.goalList});

  @override
  State<recordDialogBox> createState() => _recordDialogBoxState();
}

class _recordDialogBoxState extends State<recordDialogBox> {
  //추가 버튼 click시 firebase에 전달할 state들
  Rx<String> selectedGoalId = "".obs;
  Rx<DateTime> date = DateTime.now().obs;
  final recordContentEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedGoalId = widget.selectedGoalId.obs;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        insetPadding: const EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.r),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: BaseRecordDialogBox(widgetList: <Widget>[
          SizedBox(
            height: 19.h,
          ),
          dialogTitle(),
          SizedBox(
            height: 9.h,
          ),
          Obx(() => ODOSSelectGoalDropdown(
                goalList: widget.goalList,
                selectedGoalId: selectedGoalId.value,
                setSelectedGoalValue: (String? value) =>
                    {selectedGoalId.value = value!},
              )),
          SizedBox(
            height: 17.h,
          ),
          dateSelectButton(context),
          SizedBox(height: 11.h),
          contentText(),
          SizedBox(
            height: 9.h,
          ),
          contentTextField(),
          SizedBox(height: 12.h),
          addButton(context),
          SizedBox(
            height: 19.h,
          )
        ]));
  }

  Widget dialogTitle() {
    return Text(
      "새 기록",
      style: goalNewcardDialog,
    );
  }

  Widget dateSelectButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "날짜",
          style: inputGoalAddHintTextStyle,
          textAlign: TextAlign.start,
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: date.value,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            );
            if (selectedDate != null) {
              date.value = selectedDate;
            }
          },
          child: Row(
            children: [
              Obx(() {
                return Text(
                  " ${date.value.year}.${date.value.month.toString().padLeft(2, '0')}.${date.value.day.toString().padLeft(2, '0')}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: AppFontWeights.bold,
                  ),
                );
              }),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contentText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "내용",
          style: inputGoalAddHintTextStyle,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget contentTextField() {
    return Container(
      width: 250.w,
      height: 120.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextFormField(
        controller: recordContentEditingController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 12.h, left: 13.w),
          hintText: "오늘 한 일을 기록해봐요.",
          hintStyle: recordAddInputContentHintTextStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget addButton(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 120.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextButton(
          onPressed: () {
            //TODO: firebase에 기록 추가 기능

            Navigator.of(context).pop();
            // Get.back();
          },
          child: Text(
            "추가",
            style: recordAddConfirmTextStyle,
          ),
        ),
      ),
    );
  }
}

class BaseRecordDialogBox extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseRecordDialogBox({super.key, required this.widgetList});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300.w,
        height: 400.h,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              offset: const Offset(0, 0),
              spreadRadius: 0.5,
              blurRadius: 15,
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widgetList,
          ),
        ));
  }
}
