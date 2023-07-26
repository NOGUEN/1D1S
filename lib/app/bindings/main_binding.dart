import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() {
      return MainController();
    });
  }
}
