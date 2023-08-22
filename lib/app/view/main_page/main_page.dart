import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/main_page/goal_page.dart';
import 'package:one_day_one_something/app/view/main_page/home_page.dart';
import 'package:one_day_one_something/app/view/main_page/my_page.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_bottom_navigationbar.dart';
import 'package:one_day_one_something/app/view/main_page/social_page.dart';
import '../../controller/main/main_controller.dart';
import '../../data/model/enum/menu_code.dart';

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
  SocialPage? socialPage;
  MyPage? myPage;
  Container? settingPage;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        // return homeView;
        return HomePage();
      case MenuCode.GOAL:
        // return goalView;
        socialPage ??= SocialPage();
        return socialPage!;
      case MenuCode.MYPAGE:
        // return goalView;
        myPage ??= MyPage();
        return myPage!;
      default:
        // return LoginPage();
        return Container();
    }
  }
}
