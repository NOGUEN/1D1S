import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';
import 'package:one_day_one_something/app/view/auth/register_sub_page/email_verification_page.dart';

import 'package:one_day_one_something/app/view/auth/register_sub_page/set_account_page.dart';
import 'package:one_day_one_something/app/view/auth/register_sub_page/set_profile_page.dart';
import 'package:one_day_one_something/app/view/auth/register_sub_page/welcome_page.dart';

import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

import '../../controller/auth/register_controller.dart';

class RegisterPage extends BaseView<RegisterController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(175),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
                size: 40,
              ),
              onPressed: () {
                if (controller.tabController.index != 0) {
                  controller.tabController
                      .animateTo((controller.tabController.index - 1) % 3);
                  controller.currentTabIndex.value =
                      controller.tabController.index;
                } else {
                  Get.offAndToNamed(Routes.LOGIN);
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () {
                return SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        top: controller.currentTabIndex.value == 0 ? 0 : 25,
                        left: 20,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        child: AnimatedContainer(
                          height:
                              controller.currentTabIndex.value == 0 ? 12 : 10,
                          width:
                              controller.currentTabIndex.value == 0 ? 12 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.currentTabIndex.value == 0
                                ? AppColors.black
                                : AppColors.gray500,
                          ),
                          duration: Duration(milliseconds: 300),
                        ),
                      ),
                      AnimatedPositioned(
                        top: controller.currentTabIndex.value == 1 ? 0 : 25,
                        left: 60,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        child: AnimatedContainer(
                          height:
                              controller.currentTabIndex.value == 1 ? 12 : 10,
                          width:
                              controller.currentTabIndex.value == 1 ? 12 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.currentTabIndex.value == 1
                                ? AppColors.black
                                : AppColors.gray500,
                          ),
                          duration: const Duration(milliseconds: 300),
                        ),
                      ),
                      AnimatedPositioned(
                        top: controller.currentTabIndex.value == 2 ? 0 : 25,
                        left: 100,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                        child: AnimatedContainer(
                          height:
                              controller.currentTabIndex.value == 2 ? 12 : 10,
                          width:
                              controller.currentTabIndex.value == 2 ? 12 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: controller.currentTabIndex.value == 2
                                ? AppColors.black
                                : AppColors.gray500,
                          ),
                          duration: const Duration(milliseconds: 300),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
              child: Text(
                AppString.str_register,
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: AppFontWeights.extrabold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.tabController,
      children: [
        SetAccountPage(),
        EmailVerificationPage(),
        SetProfilePage(),
        WelcomPage(),
      ],
    );
  }
}

class BaseRegisterPage extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseRegisterPage({
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
