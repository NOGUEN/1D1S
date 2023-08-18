import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/home_page_controller.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/controller/main/my_page_controller.dart';
import 'package:one_day_one_something/app/controller/main/setting_controller.dart';
import 'package:one_day_one_something/app/controller/main/update_profile_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    });
    UpdateProfileBinding().dependencies();
    MyPageBinding().dependencies();
    HomePageBinding().dependencies();
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

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() {
      return HomePageController();
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

class UpdateProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(() {
      return UpdateProfileController();
    });
  }
}
