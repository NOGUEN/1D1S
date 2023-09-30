import 'package:get/get.dart';
import 'package:one_day_one_something/app/core/base/base_controller.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class MyPageController extends BaseController{
  List<dynamic> cardlist=[].obs;
  RxString userName="".obs;
  RxString userProfileImage="".obs;
  RxInt longestStreakNumber=0.obs;
  RxInt successfulGoalNumber=0.obs;
  RxString aboutMe="".obs;

  @override
  void onInit() {
    userName.value= '고라니';
    userProfileImage.value= 'images/image_user_profile_gorani.jpg';
    longestStreakNumber.value= 20;
    successfulGoalNumber.value= 5;
    aboutMe.value= '꾸어엉 꾸엉꾸엉';
    cardlist = [
      {
        "goalColor": AppColors.goalPinkBackground,
        "doneWeek": [true, false, true, false, false, true, true],
        "consecutive_days": 3,
        "my_goal": "목표이름1",
        "imoji": "images/icon_fire.png",
        "totalDay": 123
      },
      {
        "goalColor": AppColors.goalYellowBackground,
        "doneWeek": [true, false, true, false, false, true, true],
        "consecutive_days": 4,
        "my_goal": "목표이름2",
        "imoji": "images/icon_fire.png",
        "totalDay": 171
      },
      {
        "goalColor": AppColors.goalGreenBackground,
        "doneWeek": [true, false, true, false, false, true, true],
        "consecutive_days": 5,
        "my_goal": "목표이름3",
        "imoji": "images/icon_fire.png",
        "totalDay": 127
      },
      {
        "goalColor": AppColors.goalBlueBackground,
        "doneWeek": [true, false, true, false, false, true, true],
        "consecutive_days": 6,
        "my_goal": "목표이름4",
        "imoji": "images/icon_fire.png",
        "totalDay": 17
      },
    ];
  }
}