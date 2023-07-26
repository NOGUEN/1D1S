import 'package:get/get.dart';

import '../bindings/main_binding.dart';
import '../view/main_page.dart';
part './app_routes.dart';

// 앱 내 페이지를 정의하는 공간, 페이지 만든 후 여기에 정의해주세요
class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;
  static const TEST_PAGE = Routes.TEST_PAGE;

  static final pages = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
  ];
}
