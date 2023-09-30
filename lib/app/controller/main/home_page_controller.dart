import 'package:get/get.dart';
import '/app/core/base/base_controller.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class HomePageController extends BaseController {
  List<dynamic> everyoneSGoalList=[].obs;
  List<dynamic> everyoneSTrackList= [].obs;

  @override
  void onInit(){
    //주석처리 하여 리스트 개수 조절 가능
    everyoneSGoalList=[
      {
        "consecutive_days": 20,
        "my_goal": "내 목표"
      },
      {
        "consecutive_days": 20,
        "my_goal": "내 목표"
      },
      {
        "consecutive_days": 20,
        "my_goal": "내 목표"
      },
      {
        "consecutive_days": 20,
        "my_goal": "내 목표"
      }
    ];

    //주석처리 하여 리스트 개수 조절 가능
    everyoneSTrackList=[
      {
        "trackColor": AppColors.goalPinkBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "1"
      },
      {
        "trackColor": AppColors.goalYellowBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "2"
      },
      {
        "trackColor": AppColors.goalGreenBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "3"
      },
      {
        "trackColor": AppColors.goalBlueBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "4"
      },
      {
        "trackColor": AppColors.goalPurpleBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "5"
      },
      {
        "trackColor": AppColors.goalPinkBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "1"
      },
      {
        "trackColor": AppColors.goalYellowBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "2"
      },
      {
        "trackColor": AppColors.goalGreenBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "3"
      },
      {
        "trackColor": AppColors.goalBlueBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "4"
      },
      {
        "trackColor": AppColors.goalPurpleBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "5"
      },
      {
        "trackColor": AppColors.goalPinkBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "1"
      },
      {
        "trackColor": AppColors.goalYellowBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "2"
      },
      {
        "trackColor": AppColors.goalGreenBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "3"
      },
      {
        "trackColor": AppColors.goalBlueBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "4"
      },
      {
        "trackColor": AppColors.goalPurpleBackground,
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "5"
      },
    ];
  }
}