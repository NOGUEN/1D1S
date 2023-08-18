// ignore_for_file: constant_identifier_names

part of './app_pages.dart';

//앱 내 라우트를 정의하는 공간. "/ + 이름"으로 작명해주세요
abstract class Routes {
  Routes._();

  static const TEST_PAGE = _Paths.TEST_PAGE;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const MAIN = _Paths.MAIN;
  static const SETTING = _Paths.SETTING;
  static const UPDATE_PROFILE = _Paths.UPDATE_PROFILE;
}

abstract class _Paths {
  static const TEST_PAGE = "/TEST_PAGE";
  static const LOGIN = "/login";
  static const REGISTER = "/register";
  static const MAIN = "/main";
  static const SETTING = "/setting";
  static const UPDATE_PROFILE = "/update_profile";
}
