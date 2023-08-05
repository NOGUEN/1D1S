import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

import '../../controller/auth/register_controller.dart';

class RegisterPage extends BaseView<RegisterController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.black,
          size: 40,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      backgroundColor: AppColors.white,
      elevation: 0.0,
    );
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return _BaseRegisterPage(widgetList: [
      const SizedBox(
        height: 70,
      ),
      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "회원가입",
          style: TextStyle(
            fontSize: 35,
            fontWeight: AppFontWeights.extrabold,
          ),
        ),
      ),
      const SizedBox(
        height: 60,
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
      Obx(
        () {
          Color buttonColor;

          if ((controller.emailValue.value.isNotEmpty &&
                  controller.passwordValue.value.isNotEmpty) &&
              controller.passwordValue.value ==
                  controller.validpasswordValue.value) {
            buttonColor = AppColors.black;
          } else {
            buttonColor = AppColors.gray500;
          }

          return ODOSConfirmButton(
            buttonColor: buttonColor,
            textColor: AppColors.white,
            buttonText: AppString.str_next,
            onPressed: () {},
          );
        },
      ),
    ]);
  }
}

class _BaseRegisterPage extends StatelessWidget {
  final List<Widget> widgetList;
  const _BaseRegisterPage({
    required this.widgetList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}
