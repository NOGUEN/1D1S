import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/setting_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/system/odos_system_list.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';
import 'package:one_day_one_something/app/controller/service/auth_service.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';
class SettingPage extends BaseView<SettingController> {
  AuthService authService = AuthService();
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
        title: const Text(
          AppString.str_setting,
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
  Widget body(BuildContext context) {
    return _BaseSettingPage(
      widgetList: [
        space(height: 10),
        accountSetting(),
        space(height: 20),
        notificationSetting(),
        space(height: 20),
        serviceSetting()
      ],
    );
  }

  Widget space({required double height}){
    return SizedBox(
      height: height,
    );
  }

  Widget accountSetting(){
    return ODOSSystemList(
      list: [
        ODOSSystemListCell(menuString: "비밀번호 재설정", onPressed:(){}),
      ],
      categoryString: "계정 설정",
    );
  }

  Widget notificationSetting(){
    return ODOSSystemList(
      list: [
        ODOSSystemListCell(menuString: "리마인드 재설정", onPressed:(){}),
      ],
      categoryString: "알림 설정",
    );
  }

  Widget serviceSetting(){
    return ODOSSystemList(
      list: [
        ODOSSystemListCell(menuString: "버전", onPressed:(){}),
        ODOSSystemListCell(menuString: "로그아웃", onPressed:(){authService.logout();Get.offAndToNamed(Routes.LOGIN);}),
        ODOSSystemListCell(menuString: "회원 탈퇴", onPressed:(){authService.deleteAccount();Get.offAndToNamed(Routes.LOGIN);}),
      ],
      categoryString: "서비스",
    );
  }
}

class _BaseSettingPage extends StatelessWidget {
  final List<Widget> widgetList;
  const _BaseSettingPage({
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
