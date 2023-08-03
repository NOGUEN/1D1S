import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_add_button.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_bottom_navigationbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_system_list.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

import '../controller/main/main_controller.dart';
import '../data/model/enum/menu_code.dart';

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
  Container? goalPage;
  Container? settingPage;

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        // return homeView;
        return Container();
      case MenuCode.GOAL:
        // return goalView;
        goalPage ??= Container();
        return goalPage!;
      case MenuCode.MYPAGE:
        // return goalView;
        settingPage ??= Container();
        return settingPage!;
      default:
        // return LoginPage();
        return Container();
    }
  }
}
