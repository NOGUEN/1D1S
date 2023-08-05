import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';

class RegisterController extends BaseController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final nickNameEditingController = TextEditingController();
  final validPasswordEditingController = TextEditingController();
  var emailValue = ''.obs;
  var passwordValue = ''.obs;
  var validpasswordValue = ''.obs;

  void register() {
    showToast("가입완료");
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    nickNameEditingController.dispose();
    validPasswordEditingController.dispose();
    super.dispose();
  }
}
