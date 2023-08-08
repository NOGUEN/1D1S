import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/auth/register_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
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
      const SizedBox(
        height: 30,
      ),
      ODOSTextField(
        controller: controller.emailEditingController,
        titleText: AppString.str_email,
        hintText: AppString.str_email_hint,
        onChanged: (p0) {
          controller.emailValue.value = p0;
        },
      ),
      const SizedBox(
        height: 40,
      ),
      ODOSTextField(
        controller: controller.passwordEditingController,
        titleText: AppString.str_password,
        hintText: AppString.str_password_hint,
        needHide: true,
        onChanged: (p0) {
          controller.passwordValue.value = p0;
        },
      ),
      const SizedBox(
        height: 20,
      ),
      ODOSTextField(
        controller: controller.validPasswordEditingController,
        titleText: AppString.str_check_password,
        hintText: AppString.str_check_password_hint,
        needHide: true,
        onChanged: (p0) {
          controller.validpasswordValue.value = p0;
        },
      ),
      const SizedBox(
        height: 200,
      ),
    ]);
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
            controller.tabController
                .animateTo((controller.tabController.index + 1) % 3);
            controller.currentTabIndex.value = 1;
          };
        } else {
          buttonColor = AppColors.gray500;
          onPressed = () {
            controller.currentTabIndex.value = 1;
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
}