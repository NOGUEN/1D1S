// multi_card.dart로 대체된 페이지임.
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_week_button.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';

class ODOSGoalCard extends StatelessWidget {
  final List<bool> doneWeek;
  final int consecutiveDays;
  final int totalDay;
  final String myGoal;
  final String imoji;
  const ODOSGoalCard(
      {required this.doneWeek,
      required this.consecutiveDays,
      required this.myGoal,
      required this.imoji,
      required this.totalDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      width: 341,
      height: 360,
      decoration: BoxDecoration(
        color: AppColors.defaultBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
              offset: const Offset(0, 0),
              spreadRadius: 0.1.r,
              blurRadius: 20.r)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(2.w, 0, 10.w, 0),
                child: Image.asset(
                  imoji,
                  width: 18.61,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                myGoal,
                style: goalCardmainTitle,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SizedBox(width: 10.w),
              Expanded(
                // Wrap the ODOSWeekButton with Expanded widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "금주의 기록",
                      style: goalCardsubTitle,
                    ),
                    SizedBox(height: 18.h),
                    const ODOSWeekButton(
                        doneWeek: [true, false, true, false, false, true, true],
                        goalColor: AppColors.defaultBackground),
                    SizedBox(height: 34.h),
                    Text(
                      "현재 스트릭과  목표달성률",
                      style: goalCardsubTitle,
                    ),
                    SizedBox(height: 19.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ODOSProgressCircle(
                          percent: (consecutiveDays / totalDay).toDouble(),
                          //TODO: 소숫점 예외처리
                        ),
                        SizedBox(width: 8.w),
                        Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Text(
                            '$consecutiveDays일 연속!',
                            style: goalCardconsecutive,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
