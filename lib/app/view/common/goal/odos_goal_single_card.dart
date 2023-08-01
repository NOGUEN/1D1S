import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_week_button.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';

class ODOSGoalCard extends StatelessWidget {
  final Color goalColor;
  final List<bool> doneWeek;
  final int consecutive_days;
  final int totalDay;
  final String my_goal;
  final String imoji;
  const ODOSGoalCard(
      {required this.goalColor,
      required this.doneWeek,
      required this.consecutive_days,
      required this.my_goal,
      required this.imoji,
      required this.totalDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 341,
      height: 360,
      decoration: BoxDecoration(
        color: AppColors.defaultBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
              offset: Offset(0, 0),
              spreadRadius: 0.1,
              blurRadius: 20)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(2, 0, 10, 0),
                child: Image.asset(
                  imoji,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                my_goal,
                style: goalCardmainTitle,
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            child: Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  // Wrap the ODOSWeekButton with Expanded widget
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "금주의 기록",
                        style: goalCardsubTitle,
                      ),
                      SizedBox(height: 10),
                      ODOSWeekButton(
                        circleColor: goalColor,
                        doneWeek: [true, false, true, false, false, true, true],
                      ),
                      SizedBox(height: 34),
                      Text(
                        "현재 스트릭과  목표달성률",
                        style: goalCardsubTitle,
                      ),
                      SizedBox(height: 19),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ODOSProgressCircle(
                            circleColor: goalColor,
                            percent: (consecutive_days / totalDay).toDouble(),
                            //TODO: 소숫점 예외처리
                          ),
                          SizedBox(width: 8),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 0), // Add 3 pixels left padding
                            child: Text(
                              '$consecutive_days일 연속!',
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
          ),
        ],
      ),
    );
  }
}
