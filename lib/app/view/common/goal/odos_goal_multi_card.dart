import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_single_card.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_week_button.dart';

class GoalMulticard extends StatefulWidget {
  const GoalMulticard({super.key});

  @override
  State<GoalMulticard> createState() => _GoalMulticardState();
}

class _GoalMulticardState extends State<GoalMulticard> {
  List<ODOSGoalCard> cardlist = [
    ODOSGoalCard(
        goalColor: AppColors.redOrigin,
        doneWeek: [true, false, true, false, false, true, true],
        consecutive_days: 3,
        my_goal: "목표이름1",
        imoji: "images/icon_fire.png",
        totalDay: 123),
    ODOSGoalCard(
        goalColor: AppColors.orangeOrigin,
        doneWeek: [true, false, true, false, false, true, true],
        consecutive_days: 4,
        my_goal: "목표이름2",
        imoji: "images/icon_fire.png",
        totalDay: 171),
    ODOSGoalCard(
        goalColor: AppColors.greenOrigin,
        doneWeek: [true, false, true, false, false, true, true],
        consecutive_days: 5,
        my_goal: "목표이름3",
        imoji: "images/icon_fire.png",
        totalDay: 127),
    ODOSGoalCard(
        goalColor: AppColors.blueOrigin,
        doneWeek: [true, false, true, false, false, true, true],
        consecutive_days: 6,
        my_goal: "목표이름4",
        imoji: "images/icon_fire.png",
        totalDay: 17),
  ];
  double customEquation(double distance) {
    // return 1-(distance/1000); 이걸로 하면 신기한 모양이 됩니다.
    return 1 - min(distance.abs() / 500, 0.2);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335.5,
      child: ScrollSnapList(
          itemBuilder: _buildListItem,
          itemCount: cardlist.length,
          itemSize: 280,
          onItemFocus: (index) {},
          dynamicItemSize: true,
          dynamicSizeEquation: customEquation),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    ODOSGoalCard eachcard = cardlist[index];
    int stackday = eachcard.consecutive_days;
    return Container(
      width: 280,
      height: 295.5,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Card(
        elevation: 12,
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 280,
                    height: 285.5,
                    decoration: BoxDecoration(
                      color: AppColors.defaultBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 0, 10, 0),
                              child: Image.asset(
                                eachcard.imoji,
                                width: 18.61,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              eachcard.my_goal,
                              style: goalCardmainTitle,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
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
                                      circleColor: eachcard.goalColor,
                                      doneWeek: eachcard.doneWeek,
                                    ),
                                    SizedBox(height: 24),
                                    Text(
                                      "현재 스트릭과  목표달성률",
                                      style: goalCardsubTitle,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ODOSProgressCircle(
                                          circleColor: eachcard.goalColor,
                                          percent: (eachcard.consecutive_days /
                                                  eachcard.totalDay)
                                              .toDouble(),
                                          //TODO: 소숫점 예외처리
                                        ),
                                        SizedBox(width: 8),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left:
                                                  0), // Add 3 pixels left padding
                                          child: Text(
                                            '$stackday일 연속!',
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
                  )
                ],
              ),
            )),
      ),
    );
  }
}
