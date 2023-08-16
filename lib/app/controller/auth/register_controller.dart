import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/service/auth_service.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';
import 'package:one_day_one_something/app/data/model/firebase/user_model.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';

class RegisterController extends BaseController
    with GetTickerProviderStateMixin {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final nickNameEditingController = TextEditingController();
  final validPasswordEditingController = TextEditingController();
  final nicknameEditingController = TextEditingController();
  AuthService authService = AuthService();
  late TabController tabController;

  var emailValue = ''.obs;
  var passwordValue = ''.obs;
  var validpasswordValue = ''.obs;
  var currentTabIndex = 0.obs;
  var profileImageNumber = 0.obs;

  var emailEnabled = false.obs;
  var passwordEnabled = false.obs;
  var registerResult = 9.obs;

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

  void emailValidation(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(value)) {
      emailEnabled.value = true;
    } else {
      emailEnabled.value = false;
    }
  }

  void passwordValidation(String value) {
    if (value.isNotEmpty && value == passwordValue.value) {
      passwordEnabled.value = true;
    } else {
      passwordEnabled.value = false;
    }
  }

  Future<void> registerComplete() async {
    final userModel = UserModel(
      nickname: nickNameEditingController.text,
      name: nickNameEditingController.text,
      email: emailEditingController.text,
    );

    registerResult.value = await authService.register(
      userModel,
      validPasswordEditingController.text,
    );

    if (registerResult.value == SUCCESS) {
      Get.offAllNamed(Routes.MAIN);
    }
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
