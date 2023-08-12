import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';

class RegisterController extends BaseController
    with GetTickerProviderStateMixin {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final nickNameEditingController = TextEditingController();
  final validPasswordEditingController = TextEditingController();
  final nicknameEditingController = TextEditingController();
  late TabController tabController;

  var emailValue = ''.obs;
  var passwordValue = ''.obs;
  var validpasswordValue = ''.obs;
  var currentTabIndex = 0.obs;
  var profileImageNumber = 0.obs;

  void updateTabIndex(int index) {
    currentTabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 3);
  }

  void register() {
    showToast("가입완료");
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    nickNameEditingController.dispose();
    validPasswordEditingController.dispose();
    nicknameEditingController.dispose();

    super.dispose();
  }
}
