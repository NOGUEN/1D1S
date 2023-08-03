import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/profile/odos_profile_card.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_bottom_navigationbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'package:one_day_one_something/app/view/common/system/odos_system_list.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/common/track/odos_track_card.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_week_button.dart';
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
      children: const [
        ODOSConfirmButton(buttonColor: AppColors.black),
        ODOSTextField(),
        ODOSSubButton(),
        ODOSTrackCard(
          trackColor: Color(0xffD8E3FF),
          trackIcon: 'images/icon_blue_book.png',
          userProfileImage: 'images/image_user_profile_gorani.jpg',
          userName: '고라니',
        ),
        ODOSProfileCard(
          userName: '고라니',
          userProfileImage: 'images/image_user_profile_gorani.jpg',
          longestStreakNumber: 20,
          successfulGoalNumber: 5,
          isStreakCurrentlyMaintaining: true,
          aboutMe: '꾸어엉 꾸엉꾸엉 꾸어엉 꾸엉꾸엉\n꾸어엉 꾸엉꾸엉 꾸어엉 꾸엉꾸엉',
        ),
      ],
    );
  }

  Widget? bottomNavigationBar() {
    return ODOSBottomNavigationBar(
        onNewMenuSelected: controller.onMenuSelected);
  }
}
