import 'dart:math';

import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_single_card.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_week_button.dart';

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
      height: 345.5,
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
    var eachcard = cardlist[index];
    int stackday = eachcard["consecutive_days"];

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
                    height: 295.5,
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
                                eachcard["imoji"],
                                width: 18.61,
                                height: 24,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              eachcard["my_goal"],
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
                                      circleColor: eachcard["goalColor"],
                                      doneWeek: eachcard["doneWeek"],
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
                                          circleColor: eachcard["goalColor"],
                                          percent: (eachcard["consecutive_days"] /
                                                  eachcard["totalDay"])
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
