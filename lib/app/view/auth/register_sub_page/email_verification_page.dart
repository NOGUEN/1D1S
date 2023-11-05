import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/controller/auth/register_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';
import 'package:one_day_one_something/app/view/auth/register_page.dart';

class EmailVerificationPage extends BaseView<RegisterController> {
  bool isEmailVerified = false;
  Timer? timer;

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
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

  Widget space({required double height}){
    return SizedBox(
      height: height,
    );
  }
}
