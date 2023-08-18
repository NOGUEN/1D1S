// ignore_for_file: constant_identifier_names

abstract class AppString {
  static const str_1D1S = "1D1S";
  static const str_home = "홈";
  static const str_goal = "목표";
  static const str_setting = "설정";
  static const str_mypage = "마이페이지";
  static const str_email = "이메일";
  static const str_email_hint = "이메일";
  static const str_password = "비밀번호";
  static const str_password_hint = "비밀번호를 입력해주세요.";
  static const str_login = "로그인";
  static const str_register = "회원가입";
  static const str_go_register = "회원가입 하러가기 >";
  static const str_check_password = "비밀번호 확인";
  static const str_check_password_hint = "비밀번호를 다시 입력해주세요.";
  static const str_next = "다음 >";
  static const str_change = "변경";
  static const str_nickname = "닉네임";
  static const str_nickname_hint = "닉네임을 입력해주세요.";
  static const str_welcome_message = "환영합니다!";
  static const str_base_profile = "기본 프로필";
  static const str_everyone_s_goal_button = "모두의 목표 >";
  static const str_everyone_s_track_button = "모두의 기록 >";
  static const str_empty_goal_list = "아직 등록된 목표가 없어요!";
  static const str_empty_track_list = "아직 등록된 기록이 없어요!";
  static const str_profile = "프로필";
  static const str_about_me = "자기소개";
  static const str_about_me_hint = "자기소개를 입력해주세요.";
  // common_text의 key로 사용
  static const regular12 = "regular12";
  static const regular14 = "regular14";
  static const regular16 = "regular16";
  static const regular20 = "regular20";
  static const medium16 = "medium16";
  static const bold14 = "bold14";
  static const bold16 = "bold16";
  static const bold20 = "bold20";
  static const bold24 = "bold24";

  // Get 라우팅 argument의 key로 사용
  static const roomName = "roomName";

  static const home = "images/icon_home.svg";
  static const goal = "images/icon_pen.svg";
  static const mypage = "images/icon_person.svg";
  static const setting = "images/icon_setting.svg";
  static final profile =
      List.generate(8, (index) => "images/profile_$index.png");
}
