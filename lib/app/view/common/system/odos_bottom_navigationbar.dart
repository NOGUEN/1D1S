import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/odos_bottom_navigationbar_controller.dart';
import '../../../data/model/enum/menu_code.dart';
import '../../../data/model/menu/menu_item.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_string.dart';
import '../../theme/app_values.dart';

class ODOSBottomNavigationBar extends StatelessWidget {
  final Function(MenuCode menuCode) onNewMenuSelected;
  ODOSBottomNavigationBar({Key? key, required this.onNewMenuSelected})
      : super(key: key);

  final navController = BottomNavController();

  final Key bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Color selectedItemColor = AppColors.primaryColor;
    Color unselectedItemColor = AppColors.gray300;
    List<BottomNavItem> navItems = _getNavItems();

    return Obx(
      () => BottomNavigationBar(
        key: bottomNavKey,
        items: navItems
            .map(
              (BottomNavItem navItem) => BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  navItem.iconSVGName,
                  height: AppValues.iconDefaultSize,
                  width: AppValues.iconDefaultSize,
                  colorFilter: navItems.indexOf(navItem) ==
                          navController.selectedIndex
                      ? ColorFilter.mode(selectedItemColor, BlendMode.srcIn)
                      : ColorFilter.mode(unselectedItemColor, BlendMode.srcIn),
                ),
                label: navItem.navTitle,
                tooltip: "",
              ),
            )
            .toList(),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.pageBackground,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        currentIndex: navController.selectedIndex,
        onTap: (index) {
          navController.updateSelectedIndex(index);
          onNewMenuSelected(navItems[index].menuCode);
        },
      ),
    );
  }

  List<BottomNavItem> _getNavItems() {
    return [
      const BottomNavItem(
        navTitle: AppString.str_home,
        iconSVGName: AppString.home,
        menuCode: MenuCode.HOME,
      ),
      const BottomNavItem(
        navTitle: AppString.str_goal,
        iconSVGName: AppString.goal,
        menuCode: MenuCode.SOCIAL,
      ),
      const BottomNavItem(
        navTitle: AppString.str_mypage,
        iconSVGName: AppString.mypage,
        menuCode: MenuCode.MORE,
      ),
    ];
  }
}
