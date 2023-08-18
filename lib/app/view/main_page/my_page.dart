import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/auth/register_page.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_multi_card.dart';
import 'package:one_day_one_something/app/view/common/profile/odos_profile_card.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class MyPage extends BaseView<MainController> {
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
    return BaseMyPage();
  }
}

class BaseMyPage extends StatelessWidget {
  const BaseMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            ODOSProfileCard(
                userName: '고라니',
                userProfileImage: 'images/image_user_profile_gorani.jpg',
                longestStreakNumber: 20,
                successfulGoalNumber: 5,
                isStreakCurrentlyMaintaining: true,
                aboutMe: '꾸어엉 꾸엉꾸엉'
            ).marginOnly(left: 20, right: 20, top: 21, bottom: 8),
            GoalMulticard(),
          ]
        )
    );;
  }
}
