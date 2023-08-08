import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';

import '../../controller/auth/login_controller.dart';
import '../theme/app_values.dart';

class LoginPage extends BaseView<LoginController> {
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
    return _BaseLoginPage(
      widgetList: [
        const SizedBox(
          height: 150,
        ),
        const Text(
          AppString.str_1D1S,
          style: TextStyle(
            fontSize: 54,
            fontWeight: AppFontWeights.heavy,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ODOSTextField(
          controller: controller.emailEditingController,
          titleText: AppString.str_email,
          hintText: AppString.str_email_hint,
          inputType: TextInputType.emailAddress,
          onChanged: (p0) {
            controller.emailValue.value = p0;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ODOSTextField(
          controller: controller.passwordEditingController,
          titleText: AppString.str_password,
          hintText: AppString.str_password_hint,
          inputType: TextInputType.visiblePassword,
          needHide: true,
          onChanged: (p0) {
            controller.passwordValue.value = p0;
          },
        ),
        const SizedBox(
          height: 40,
        ),
        Obx(
          () {
            Color buttonColor;
            GestureTapCallback onPressedFunc;
            if (controller.emailValue.value.isNotEmpty &&
                controller.passwordValue.value.isNotEmpty) {
              buttonColor = AppColors.black;
              onPressedFunc = () => controller.login();
            } else {
              buttonColor = AppColors.gray300;
              onPressedFunc = () {};
            }
            return ODOSConfirmButton(
              buttonText: AppString.str_login,
              textColor: AppColors.white,
              buttonColor: buttonColor,
              onPressed: onPressedFunc,
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ODOSSubButton(
          textColor: AppColors.black,
          buttonText: AppString.str_go_register,
          onPressed: () => controller.goRegister(),
        ),
      ],
    );
  }
}

class _BaseLoginPage extends StatelessWidget {
  final List<Widget> widgetList;
  const _BaseLoginPage({
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
