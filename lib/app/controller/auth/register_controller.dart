import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/service/auth_service.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';
import 'package:one_day_one_something/app/data/model/firebase/user_model.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegisterController extends BaseController
    with GetTickerProviderStateMixin {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final validPasswordEditingController = TextEditingController();
  final nicknameEditingController = TextEditingController();
  AuthService authService = AuthService();
  late TabController tabController;
  var isEmailVerified = false.obs;
  late Timer timer;
  var emailValue = ''.obs;
  var passwordValue = ''.obs;
  var validpasswordValue = ''.obs;
  var currentTabIndex = 0.obs;
  var profileImageNumber = 0.obs;
  var nicknameValue = ''.obs;
  var userId = ''.obs;
  var emailEnabled = false.obs;
  var passwordEnabled = false.obs;
  var registerResult = FirebaseCode.ERROR.obs;
  void updateTabIndex(int index) {
    currentTabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 4);
    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        isEmailVerified.value = true;
      }
    });
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

  void passwordValidationReverse(String value){
    if (value.isNotEmpty && value == validpasswordValue.value) {
      passwordEnabled.value = true;
    } else {
      passwordEnabled.value = false;
    }
  }

  // checkEmailVerified() async {
  //   await FirebaseAuth.instance.currentUser?.reload();
  //   isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
  //   if (isEmailVerified.value) {
  //     // TODO: implement your code after email verification
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text("Email Successfully Verified")));
  //
  //     timer?.cancel();
  //   }
  // }
  Future<void> checkEmailVerification() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    ActionCodeSettings actionCodeSettings = ActionCodeSettings(
      url: 'https://d1s-af0ff.firebaseapp.com/?email=' + emailValue.value,
      handleCodeInApp: false,
      iOSBundleId: 'com.example.one_day_one_something',
      androidPackageName: 'com.example.one_day_one_something',
      androidInstallApp: true,
      androidMinimumVersion: '12',
      dynamicLinkDomain: 'onedayonesomething.page.link'
    );
    await firebaseAuth.currentUser?.sendEmailVerification(actionCodeSettings);
    await auth.sendSignInLinkToEmail(
      email: emailValue.value,
      actionCodeSettings: actionCodeSettings,
    ).catchError((onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification'));
    auth.authStateChanges().listen((User? user) {
      if (user != null && user.emailVerified) {
        // 이메일이 인증되었습니다.
        // 여기에 이메일 인증이 완료된 후의 로직을 작성합니다.
        isEmailVerified.value = true;
      }
      else{
        isEmailVerified.value = false;
      }
    });
  }
  Future<FirebaseCode> register() async {
    var timestamp = DateTime.now().millisecondsSinceEpoch ~/ 60000;
    final userModel = UserModel(
      nickname: nicknameEditingController.text,
      name: nicknameEditingController.text,
      email: emailValue.value,
      signUpTime: timestamp
    );

    registerResult.value = await authService.register(
      userModel,
      passwordValue.value,
    );
    userId.value = userModel.uid ?? '';
    return registerResult.value;
  }

  Future<void> addProfile() async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    return await usersCollection.doc(userId.value).update({'nickname': nicknameValue.value, 'profileImageNumber': profileImageNumber.value});
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    nicknameEditingController.dispose();
    validPasswordEditingController.dispose();
    timer.cancel();
    super.dispose();
  }
}
