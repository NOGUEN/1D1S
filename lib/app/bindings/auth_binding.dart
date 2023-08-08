import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/auth/login_controller.dart';
import 'package:one_day_one_something/app/controller/auth/register_controller.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController();
    });
  }
}

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() {
      return RegisterController();
    });
  }
}
