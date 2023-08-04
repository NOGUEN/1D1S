import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_bottom_navigationbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'package:one_day_one_something/app/view/common/system/odos_system_list.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/common/track/odos_track_card.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_week_button.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_add_button.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_my_goal.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_list.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_single_card.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_multi_card.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

import '../controller/main/main_controller.dart';

class MainPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const ODOSAppBar();
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        GoalMulticard(),
        ODOSGoalList(
          imoji: "images/icon_fire.png",
          circleColor: AppColors.gray700,
          my_goal: "내 목표",
          percent: 0.5,
        ),
        // ODOSGoalCard(
        //     goalColor: Color(0xFF237CE8),
        //     doneWeek: [true, false, true, false, false, true, true],
        //     consecutive_days: 3,
        //     my_goal: "목표이름1",
        //     imoji: "images/icon_fire.png",
        //     totalDay: 123),
      ],
    );
  }

  Widget? bottomNavigationBar() {
    return ODOSBottomNavigationBar(
        onNewMenuSelected: controller.onMenuSelected);
  }
}
