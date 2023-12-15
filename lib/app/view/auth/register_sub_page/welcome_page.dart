// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/auth/register_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';
import 'package:one_day_one_something/app/view/auth/register_page.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

class WelcomPage extends BaseView<RegisterController> {
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
    return BaseRegisterPage(
      widgetList: [space(height: 50), welcomeText(), welcomeIcon()],
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return Obx(
      () {
        Color buttonColor;
        void Function() onPressed;

        if ((controller.emailValue.value.isNotEmpty &&
                controller.passwordValue.value.isNotEmpty) &&
            controller.passwordValue.value ==
                controller.validpasswordValue.value) {
          buttonColor = AppColors.black;
          onPressed = () {
            Get.offAndToNamed(Routes.MAIN);
          };
        } else {
          buttonColor = AppColors.gray500;
          onPressed = () {
            Get.offAndToNamed(Routes.MAIN);
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

  Widget space({required double height}) {
    return SizedBox(
      height: height,
    );
  }

  Widget welcomeText() {
    return const Text(
      AppString.str_welcome_message,
      style: TextStyle(
        fontSize: 48,
        fontWeight: AppFontWeights.bold,
      ),
    );
  }

  Widget welcomeIcon() {
    return const Text(
      "🎉",
      style: TextStyle(
        fontSize: 125,
      ),
    );
  }
}
