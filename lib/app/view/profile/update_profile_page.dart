import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/controller/main/update_profile_controller.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'dart:io';
class UpdateProfilePage extends BaseView<UpdateProfileController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
        title: const Text(
          AppString.str_profile,
          style: TextStyle(
            fontSize: 24,
            fontWeight: AppFontWeights.regular,
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: AppColors.gray300,
            height: 1.0,
          ),
        ));
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return BaseUpdateProfilePage(widgetList: [
      const SizedBox(
        height: 15,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              controller.getImage();
            },
            child: Obx(
              () {
                return Container(
                    width: 190,
                    height: 190,
                    child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: controller.imagePickerUsed.value
                                ? Image.file(
                              File(controller.image!.path),
                              width: 180,
                              height: 180,
                            )
                                : Image(
                              width: 180,
                              height: 180,
                              image: AssetImage(
                                AppString.profile[
                                controller.profileImageNumber.value
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                width:70,
                                height:70,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: AppColors.gray300, border: Border.all(color:AppColors.white, width: 5.0)),
                                child: const Icon(
                                    Icons.camera_alt,
                                    color: AppColors.white,
                                    size:35
                                )
                            ),
                          )
                        ]
                    )

                );
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
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
        height: 180,
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
                if (controller.imagePickerUsed.value == false && controller.profileImageNumber.value == index) {
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
                    controller.imagePickerUsed.value = false;
                  },
                );
              },
            );
          },
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      ODOSTextField(
        controller: controller.nickNameEditingController,
        titleText: AppString.str_nickname,
        hintText: AppString.str_nickname_hint,
        onChanged: (p0) {
          controller.validNickNameValue.value = p0;
        },
      ),
      const SizedBox(
        height: 20,
      ),
      ODOSTextField(
        controller: controller.aboutMeController,
        titleText: AppString.str_about_me,
        hintText: AppString.str_about_me_hint,
        onChanged: (p0) {
          controller.validAboutMeValue.value = p0;
        },
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }

  @override
  Widget? bottomNavigationBar() {
    return Obx(
          () {
        Color buttonColor;
        void Function() onPressed;

        if (controller.validNickNameValue.value.isNotEmpty) {
          buttonColor = AppColors.black;
          onPressed = () {
            Get.back();
          };
        } else {
          buttonColor = AppColors.gray500;
          onPressed = (){
            // nothing
          };
        }

        return Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
          child: ODOSConfirmButton(
            buttonColor: buttonColor,
            textColor: AppColors.white,
            buttonText: AppString.str_change,
            onPressed: onPressed,
          ),
        );
      },
    );
  }
}

class BaseUpdateProfilePage extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseUpdateProfilePage({
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