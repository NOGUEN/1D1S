import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_miniver.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_fast_record.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class ODOSGoalList extends StatelessWidget {
  final String goalId;
  final Color goalColor;
  final String my_goal;
  final int consecutive_days;
  final int total_days;
  final bool isBookmarked;
  final Widget recordDialogBox;
  const ODOSGoalList(
      {super.key,
      required this.goalId,
      required this.goalColor,
      required this.my_goal,
      required this.consecutive_days,
      required this.total_days,
      required this.isBookmarked,
      required this.recordDialogBox});

  @override
  Widget build(BuildContext context) {
    return BaseGoalList(
      goalColor: goalColor,
      widgetList: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ODOSProgressMiniCircle(
                    percent: (consecutive_days /
                        total_days)
                        .toDouble(),
                    //TODO: 소숫점 예외처리,
                  ),
                  SizedBox(width: 17.w),
                  goalTitle(my_goal: my_goal)
                ],
              ),
              buttonContainer(isBookmarked: isBookmarked)
            ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentStreak(consecutive_days: consecutive_days),
            addRecordButton(context: context, recordDialogBox: recordDialogBox),
          ],
        ),
      ],
    );
  }
}

class BaseGoalList extends StatelessWidget {
  final List<Widget> widgetList;
  final Color goalColor;

  const BaseGoalList({
    super.key,
    required this.widgetList,
    required this.goalColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.w,
        height: 120.h,
        padding: EdgeInsets.only(left: 15.w, top: 14.h, right: 20.w, bottom: 11.h),
        decoration: BoxDecoration(
          color: goalColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                offset: Offset(0, 0),
                spreadRadius: 0.1,
                blurRadius: 20)
          ],
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widgetList,
      )
    );
  }
}

Widget goalTitle({my_goal}){
  return Container(
    child: Text(
      my_goal,
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      style: goalListHead,
    ),
  );
}

Widget buttonContainer({isBookmarked}){
  return Container(
    alignment: Alignment.topRight,
    child: Row(
      children: [
        isBookmarked ? starButton() : SizedBox.shrink(),
        moreVertButton(),
      ],
    ),
  );
}

Widget starButton(){
  return Container(
      width: 24.w,
      height: 20.h,
      // color: Colors.red,
      child: IconButton(
        padding: EdgeInsets.all(0),
        color: AppColors.white,
        icon: Icon(
          Icons.star,
          size: 20.h,
        ),
        onPressed: () {
          // star 버튼을 눌렀을 때 동작
        },
      )
  );
}

Widget moreVertButton(){
  return Container(
      width: 24.w,
      height: 20.h,
      // color: Colors.red,
      child: IconButton(
        padding: EdgeInsets.all(0),
        color: AppColors.white,
        icon: Icon(
          Icons.more_vert,
          size: 20.h,
        ),
        onPressed: () {
          // more_vert 버튼을 눌렀을 때 동작
        },
      )
  );
}

Widget currentStreak({consecutive_days}){
  return Text(
    '$consecutive_days일 연속',
    style: goalListStackDay,
  );
}

Widget addRecordButton({context, required Widget recordDialogBox}){
  return Container(  //기록 추가 button
    width: 100.w,
    height: 30.h,
    decoration: BoxDecoration(
      color: AppColors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15.h),
    ),
    child: TextButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return recordDialogBox;
            }
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("기록 추가 ", style: goalListAddRecordButton),
          Text("+", style: goalListAddRecordButtonIcon)
        ],
      ),
    ),
  );
}