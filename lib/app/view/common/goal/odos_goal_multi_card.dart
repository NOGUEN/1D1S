import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_single_card.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_week_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalMulticard extends StatelessWidget {

  final List<dynamic> cardlist;
  double customEquation(double distance) {
    // return 1-(distance/1000); 이걸로 하면 신기한 모양이 됩니다.
    return 1 - min(distance.abs() / 500, 0.2);
  }

  const GoalMulticard({
    super.key,
    required this.cardlist
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 315.6.h,
      child: ScrollSnapList(
          itemBuilder: _buildListItem,
          itemCount: cardlist.length,
          itemSize: 280.w,
          onItemFocus: (index) {},
          dynamicItemSize: true,
          dynamicSizeEquation: customEquation),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    var eachcard = cardlist[index];

    return BaseGoalMultiCard(
      widgetList: [
        goalTitle(
            my_goal: eachcard["my_goal"]
        ),
        space(height: 8.h),
        goalSubTitle(text: "금주의 기록"),
        space(height: 10.h),
        ODOSWeekButton(
          doneWeek: eachcard["doneWeek"],
          goalColor: eachcard["goalColor"],
        ),
        space(height: 24.h),
        goalSubTitle(text: "현재 스트릭과  목표달성률"),
        space(height: 12.h),
        currentStreakAndProgressRate(
            consecutive_days: eachcard["consecutive_days"],
            totalDay: eachcard["totalDay"],
        )
      ],
      goalColor: eachcard["goalColor"]
    );
  }
}

class BaseGoalMultiCard extends StatelessWidget {
  final List<Widget> widgetList;
  final Color goalColor;
  const BaseGoalMultiCard({
    super.key,
    required this.widgetList,
    required this.goalColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 295.5.h,
      margin: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
          boxShadow: [odosShadow]
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                width: 280.w,
                height: 265.5.h,
                decoration: BoxDecoration(
                  color: goalColor,
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widgetList,
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

Widget space({height}){
  return SizedBox(height: height);
}

Widget goalTitle({my_goal}){
  return Text(
    my_goal,
    style: goalCardmainTitle,
  );
}

Widget goalSubTitle({text}){
  return Text(
    text,
    style: goalCardsubTitle,
  );
}

Widget currentStreakAndProgressRate({consecutive_days, totalDay}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      ODOSProgressCircle(
        percent: (consecutive_days /
            totalDay)
            .toDouble(),
        //TODO: 소숫점 예외처리
      ),
      SizedBox(width: 8.w),
      Padding(
        padding: EdgeInsets.only(left: 3.w), // Add 3 pixels left padding
        child: Text(
          '$consecutive_days일 연속!',
          style: goalCardconsecutive,
        ),
      ),
    ],
  );
}