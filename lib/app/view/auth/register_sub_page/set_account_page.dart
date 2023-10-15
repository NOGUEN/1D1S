import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/auth/register_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/data/firebase/firebase_const.dart';
import 'package:one_day_one_something/app/data/model/enum/menu_code.dart';
import 'package:one_day_one_something/app/view/auth/register_page.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

class SetAccountPage extends BaseView<RegisterController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return BaseRegisterPage(widgetList: [
      space(height: 30),
      emailText(),
      space(height: 40),
      passwordText(),
      space(height: 20),
      validPasswordText(),
      space(height: 200),
    ]);
  }

  @override
  Widget? bottomNavigationBar() {
    return Obx(
      () {
        Color buttonColor;
        void Function() onPressed;
        late FirebaseCode registerResult;

        if (controller.emailEnabled.value && controller.passwordEnabled.value) {
          buttonColor = AppColors.black;
          onPressed = () async {
            registerResult = await controller.register();
            if (registerResult == FirebaseCode.SUCCESS) {
              firebaseAuth.currentUser?.sendEmailVerification();
              controller.tabController
                  .animateTo((controller.tabController.index + 1) % 4);
              controller.currentTabIndex.value = 1;
            } else if (registerResult == FirebaseCode.EMAIL_ALREADY_IN_USE) {
              showToast("이미 가입된 이메일입니다.");
            }
          };
        } else {
          buttonColor = AppColors.gray500;
          onPressed = () {
            controller.currentTabIndex.value = 0;
          };
        }

        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
          child: ODOSConfirmButton(
            buttonColor: buttonColor,
            textColor: AppColors.white,
            buttonText: AppString.str_next,
            onPressed: onPressed,
          ),
        );
      },
    );
  }

  Widget space({required double height}){
    return SizedBox(
      height: height,
    );
  }

  Widget emailText(){
    return ODOSTextField(
      controller: controller.emailEditingController,
      titleText: AppString.str_email,
      hintText: AppString.str_email_hint,
      onChanged: (p0) {
        controller.emailValue.value = p0;
        controller.emailValidation(p0);
      },
    );
  }

  Widget passwordText(){
    return ODOSTextField(
      controller: controller.passwordEditingController,
      titleText: AppString.str_password,
      hintText: AppString.str_password_hint,
      needHide: true,
      onChanged: (p0) {
        controller.passwordValue.value = p0;
        controller.passwordValidationReverse(p0);
        showToast(controller.passwordValue.value);
      },
    );
  }

  Widget validPasswordText(){
    return ODOSTextField(
      controller: controller.validPasswordEditingController,
      titleText: AppString.str_check_password,
      hintText: AppString.str_check_password_hint,
      needHide: true,
      onChanged: (p0) {
        controller.validpasswordValue.value = p0;
        controller.passwordValidation(p0);
        showToast(controller.validpasswordValue.value);
      },
    );
  }
}
