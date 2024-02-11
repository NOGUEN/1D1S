// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/controller/main/home_page_controller.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_fast_record.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_list.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class HomePage extends BaseView<HomePageController> {
  ScrollController scrollController;

  HomePage({required this.scrollController});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return BaseHomePage(
      everyoneSGoalList: controller.everyoneSGoalList,
      everyoneSTrackList: controller.everyoneSTrackList,
      scrollController: scrollController,
    );
  }
}

class BaseHomePage extends StatelessWidget {
  final List everyoneSGoalList;
  final List everyoneSTrackList;
  final ScrollController scrollController;

  BaseHomePage({
    super.key,
    required this.everyoneSGoalList,
    required this.everyoneSTrackList,
    required this.scrollController,
  });

  List exampleList = [
    {
      "goalId": "1",
      "goalColor": AppColors.goalPinkBackground,
      "my_goal": "목표 이름1",
      "consecutive_days": 10,
      "total_days": 30,
      "isBookmarked": true
    },
    {
      "goalId": "2",
      "goalColor": AppColors.goalYellowBackground,
      "my_goal": "목표 이름2",
      "consecutive_days": 15,
      "total_days": 30,
      "isBookmarked": false
    },
    {
      "goalId": "3",
      "goalColor": AppColors.goalGreenBackground,
      "my_goal": "목표 이름3",
      "consecutive_days": 20,
      "total_days": 30,
      "isBookmarked": false
    },
    {
      "goalId": "4",
      "goalColor": AppColors.goalBlueBackground,
      "my_goal": "목표 이름4",
      "consecutive_days": 30,
      "total_days": 30,
      "isBookmarked": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: UniqueKey(),
      child: ListView(
        controller: scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List<Widget>.generate(exampleList.length, (idx) {
                dynamic listItem = exampleList[idx];
                return Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: ODOSGoalList(
                    goalId: listItem["goalId"],
                    goalColor: listItem["goalColor"],
                    myGoal: listItem["my_goal"],
                    consecutiveDays: listItem["consecutive_days"],
                    totalDays: listItem["total_days"],
                    isBookmarked: listItem["isBookmarked"],
                    recordDialogBox: recordDialogBox(
                      selectedGoalId: listItem["goalId"],
                      goalList: exampleList,
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
