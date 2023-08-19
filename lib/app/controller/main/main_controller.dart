import 'package:get/get.dart';

import '../../data/model/enum/menu_code.dart';
import '/app/core/base/base_controller.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }
}
