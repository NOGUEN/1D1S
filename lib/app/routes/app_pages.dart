// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:one_day_one_something/app/view/auth/login_page.dart';
import 'package:one_day_one_something/app/view/auth/register_page.dart';
import 'package:one_day_one_something/app/view/setting/setting_page.dart';
import 'package:one_day_one_something/app/view/update_profile_page.dart';

import '../bindings/auth_binding.dart';
import '../bindings/main_binding.dart';
// import '../bindings/mypage_binding.dart';
import '../view/main_page.dart';
part './app_routes.dart';

// 앱 내 페이지를 정의하는 공간, 페이지 만든 후 여기에 정의해주세요
class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static const TEST_PAGE = Routes.TEST_PAGE;

  static final pages = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterPage(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingPage(),
      binding: SettingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => UpdateProfilePage(),
      binding: UpdateProfileBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
