import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/update_profile_controller.dart';

// class MypageBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<MypageController>(() {
//       return MypageController();
//     });
//   }
// }

class UpdateProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(() {
      return UpdateProfileController();
    });
  }
}
