import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/controller/main/setting_controller.dart';
import 'package:one_day_one_something/app/controller/main/update_profile_controller.dart';
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    });
    UpdateProfileBinding().dependencies();
  }
}

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() {
      return SettingController();
    });
  }
}

class UpdateProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(() {
      return UpdateProfileController();
    });
  }
}
