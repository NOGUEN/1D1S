import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/controller/auth/register_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';
import 'package:one_day_one_something/app/view/auth/register_page.dart';
import 'package:get/get.dart';
class EmailVerificationPage extends BaseView<RegisterController> {
  bool isEmailVerified = false;
  Timer? timer;

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    var user = FirebaseAuth.instance.currentUser;
    isEmailVerified = user!.emailVerified;

    if (isEmailVerified) {
      timer?.cancel();
      // 이메일이 인증된 후의 로직
    } else if (user.metadata.creationTime == user.metadata.lastSignInTime) {
      // 이메일 인증이 되지 않은 경우, 계정 삭제
      await user.delete();
    }
  }
  Future<void> performRegister() async {
    // isEmailVerified가 true이므로 register를 수행합니다.
    try {
      await controller.register();
      controller.tabController
          .animateTo((controller.tabController.index + 1) % 3);
      controller.currentTabIndex.value = 2;
      controller.isEmailVerified.value = false;
    } catch (e) {
      // 오류 처리
      print('Register Error: $e');
    }
  }
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () {
        if(controller.isEmailVerified.value){
          // registerResult = await controller.register();
          controller.tabController
               .animateTo((controller.tabController.index + 1) % 4);
          controller.currentTabIndex.value = 2;
          controller.isEmailVerified.value = false;
        }
        return BaseRegisterPage(
          widgetList: [
            space(height: 35),
            space(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: Text(
                  'We have sent you a Email on  ${firebaseAuth.currentUser?.email}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            space(height: 16),
            const Center(child: CircularProgressIndicator()),
            space(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: Text(
                  'Verifying email....',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            space(height: 57),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                child: const Text('Resend'),
                onPressed: () {
                  try {} catch (e) {
                    debugPrint('$e');
                  }
                },
              ),
            ),
          ],
        );
      }
    );
  }

  Widget space({required double height}){
    return SizedBox(
      height: height,
    );
  }
}
