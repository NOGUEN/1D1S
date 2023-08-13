import 'package:get/get.dart';

import '../../data/model/enum/menu_code.dart';
import '/app/core/base/base_controller.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  List<dynamic> everyoneSGoalList=[].obs;
  List<dynamic> everyoneSTrackList= [].obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

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
        "trackColor": AppColors.redBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "1"
      },
      {
        "trackColor": AppColors.orangeBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "2"
      },
      {
        "trackColor": AppColors.yellowBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "3"
      },
      {
        "trackColor": AppColors.greenBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "4"
      },
      {
        "trackColor": AppColors.blueBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "5"
      },
      {
        "trackColor": AppColors.purpleBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "6"
      },
      {
        "trackColor": AppColors.defaultBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "7"
      },
      {
        "trackColor": AppColors.redBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "8"
      },
      {
        "trackColor": AppColors.orangeBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "9"
      },
      {
        "trackColor": AppColors.yellowBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "10"
      },
      {
        "trackColor": AppColors.greenBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "11"
      },
      {
        "trackColor": AppColors.blueBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "12"
      },
      {
        "trackColor": AppColors.purpleBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "13"
      },
      {
        "trackColor": AppColors.defaultBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "14"
      },
      {
        "trackColor": AppColors.redBackground,
        "trackIcon": 'images/icon_blue_book.png',
        "userProfileImage": 'images/image_user_profile_gorani.jpg',
        "userName": "15"
      }
    ];
  }

  onMenuSelected(MenuCode menuCode) async {
    _selectedMenuCodeController(menuCode);
  }
}
