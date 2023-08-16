import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/controller/main/my_page_controller.dart';
import 'package:one_day_one_something/app/controller/main/setting_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    });
    MyPageBinding().dependencies();
  }
}

class MyPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPageController>(() {
      return MyPageController();
    });
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
