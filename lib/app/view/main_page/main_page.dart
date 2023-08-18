import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_add_button.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_my_goal.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_list.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_single_card.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_multi_card.dart';
import 'package:one_day_one_something/app/view/main_page/goal_page.dart';
import 'package:one_day_one_something/app/view/main_page/my_page.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/common/profile/odos_profile_card.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_bottom_navigationbar.dart';
import 'package:one_day_one_something/app/view/main_page/home_page.dart';
import '../../controller/main/main_controller.dart';
import '../../data/model/enum/menu_code.dart';
import '../common/system/odos_appbar.dart';
import '../common/system/odos_bottom_navigationbar.dart';

class MainPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const ODOSAppBar();
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      key: UniqueKey(),
      child: Obx(() => getPageOnSelectedMenu(controller.selectedMenuCode)),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return ODOSBottomNavigationBar(
        onNewMenuSelected: controller.onMenuSelected);
  }

  final Container homePage = Container();
  GoalPage? goalPage;
  MyPage? myPage;
  Container? settingPage;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        // return homeView;
        return HomePage();
      case MenuCode.GOAL:
        // return goalView;
        goalPage ??= GoalPage();
        return goalPage!;
      case MenuCode.MYPAGE:
        // return goalView;
        myPage ??=MyPage();
        return myPage!;
      default:
        // return LoginPage();
        return Container();
    }
  }
}
