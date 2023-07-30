import '../enum/menu_code.dart';

class BottomNavItem {
  final String navTitle;
  final String iconSVGName;
  final MenuCode menuCode;

  const BottomNavItem({
    required this.navTitle,
    required this.iconSVGName,
    required this.menuCode,
  });
}
