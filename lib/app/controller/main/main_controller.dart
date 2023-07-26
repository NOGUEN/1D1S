import 'package:get/get.dart';

import '../../data/model/enum/menu_code.dart';
import '/app/core/base/base_controller.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }
}
