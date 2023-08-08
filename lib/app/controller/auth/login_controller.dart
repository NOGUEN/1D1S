import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';

import '../../routes/app_pages.dart';

class LoginController extends BaseController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  var emailValue = ''.obs;
  var passwordValue = ''.obs;

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  void login() {
    showToast("로그인 성공 : ${emailEditingController.value.text}");
    Get.offAndToNamed(Routes.MAIN);
  }

  void goRegister() {
    Get.offAndToNamed(Routes.REGISTER);
  }
}
