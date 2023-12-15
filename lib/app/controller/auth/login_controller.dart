import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/service/auth_service.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';

import '../../routes/app_pages.dart';

class LoginController extends BaseController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  var emailValue = ''.obs;
  var passwordValue = ''.obs;
  AuthService authService = AuthService();
  RxInt loginResult = 9.obs;

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    loginResult.value =
        await authService.login(emailValue.value, passwordValue.value);

    if (loginResult.value == SUCCESS) {
      showToast("로그인 성공 : ${emailValue.value}");
      Get.offAndToNamed(Routes.MAIN);
    } else {
      showToast("로그인 실패 : ${emailValue.value}");
    }
  }

  void goRegister() {
    Get.toNamed(Routes.REGISTER);
  }
}
