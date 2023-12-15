import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSMyGoal extends StatelessWidget {
  final int consecutiveDays;
  final String myGoal;
  final String imoji;
  const ODOSMyGoal(
      {super.key,
      required this.consecutiveDays,
      required this.myGoal,
      required this.imoji});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.defaultBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: const Offset(0, 0),
              spreadRadius: 0.1,
              blurRadius: 20)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              margin: EdgeInsets.fromLTRB(2.w, 0, 10.w, 0),
              child: Image.asset(
                imoji,
                width: 25,
                height: 25,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              myGoal,
              style: trackCardHead,
            ),
          ]),
          Container(
              margin: EdgeInsets.only(left: 2.w),
              child: Text(
                '$consecutiveDays일 연속!',
                style: trackCardHead,
              ))
        ],
      ),
    );
  }
}
