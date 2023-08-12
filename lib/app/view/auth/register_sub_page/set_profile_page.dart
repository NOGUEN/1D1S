import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/auth/register_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/data/model/enum/menu_code.dart';
import 'package:one_day_one_something/app/view/auth/register_page.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'package:one_day_one_something/app/view/common/system/odos_common_text.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

class SetProfilePage extends BaseView<RegisterController> {
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
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () {
              return Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(width: 4),
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      AppString.profile[controller.profileImageNumber.value],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ODOSTextField(
              controller: controller.nicknameEditingController,
              titleText: AppString.str_nickname,
              hintText: AppString.str_nickname_hint,
            ),
          )
        ],
      ),
      const SizedBox(
        height: 20,
      ),
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            AppString.str_base_profile,
            style: TextStyle(
              fontSize: 20,
              fontWeight: AppFontWeights.regular,
              color: AppColors.black,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 350,
        width: double.infinity,
        child: GridView.builder(
          itemCount: 8,
          primary: false,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Obx(
              () {
                Color radiusColor;
                if (controller.profileImageNumber.value == index) {
                  radiusColor = AppColors.black;
                } else {
                  radiusColor = Colors.transparent;
                }
                return GestureDetector(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppString.profile[index]),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: radiusColor,
                              width: 3,
                              strokeAlign: BorderSide.strokeAlignInside),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    controller.profileImageNumber.value = index;
                  },
                );
              },
            );
          },
        ),
      )
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
            controller.currentTabIndex.value = 2;
          };
        } else {
          buttonColor = AppColors.gray500;
          onPressed = () {
            controller.tabController
                .animateTo((controller.tabController.index + 1) % 3);
            controller.currentTabIndex.value = 2;
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
