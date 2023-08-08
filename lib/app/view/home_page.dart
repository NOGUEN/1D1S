import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_my_goal.dart';
import 'package:one_day_one_something/app/view/common/track/odos_track_card.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import '../controller/main/main_controller.dart';
import 'dart:math';

class HomePage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor(){
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return BaseHomePage(
      everyoneSGoalList: [
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
      ],
      everyoneSTrackList: [
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
        },
      ],
    );
  }
}

class EveryoneSTrackListSingleLine extends StatelessWidget {
  final List trackList;
  final bool reverseScroll;
  const EveryoneSTrackListSingleLine({
    super.key,
    required this.trackList,
    required this.reverseScroll
  });

  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      delay: Duration(seconds: 0),
      duration: Duration(seconds: 30),
      duplicateChild: 4,
      reverseScroll: reverseScroll,
      gap: 0,
      scrollDirection: Axis.horizontal,
      enableScrollInput: false,
      child: Container(
        clipBehavior: Clip.none,
        height: 140,
        child: Row(
            children: trackList.map(
                (trackCard) =>
                  ODOSTrackCard(
                      trackColor: trackCard["trackColor"],
                      trackIcon: trackCard["trackIcon"],
                      userProfileImage: trackCard["userProfileImage"],
                      userName: trackCard["userName"]
                  ).marginOnly(right: 12)
            ).toList()
        ),
      ),
    );
  }
}



class BaseHomePage extends StatelessWidget {
  final List everyoneSGoalList;
  final List everyoneSTrackList;
  const BaseHomePage({
    super.key,
    required this.everyoneSGoalList,
    required this.everyoneSTrackList
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: UniqueKey(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(  //모두의 목표 버튼
            padding: const EdgeInsets.fromLTRB(16, 21, 0, 0),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)
              ),
              onPressed: (){},
              child: Text("모두의 목표 >", style: everyoneSGoalButtonTextStyle),
            ),
          ),
          SizedBox( //모두의 목표 리스트
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(24, 20, 24, 20),
              clipBehavior: Clip.none,
              physics: ClampingScrollPhysics(),
              itemCount: everyoneSGoalList.length,
              itemBuilder: (BuildContext context, int index){
                return ODOSMyGoal(
                    consecutive_days: everyoneSGoalList[index]["consecutive_days"],
                    my_goal: everyoneSGoalList[index]["my_goal"],
                    imoji: 'images/icon_fire.png'
                ).marginOnly(right: 17);
              },
            ),
          ),
          Padding(  //모두의 기록 버튼
            padding: const EdgeInsets.fromLTRB(16, 21, 0, 20),
            child: TextButton(
              style: ButtonStyle(
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent)
              ),
              onPressed: (){},
              child: Text("모두의 기록 >", style: everyoneSGoalButtonTextStyle),
            ),
          ),
          Column(
            children: [
              Transform.translate(
                offset: Offset(0, -20),
                child: EveryoneSTrackListSingleLine(trackList: everyoneSTrackList.sublist(0, 5), reverseScroll: true,)
              ),
              Transform.translate(
                  offset: Offset(0, -40),
                  child: EveryoneSTrackListSingleLine(trackList: everyoneSTrackList.sublist(5, 10), reverseScroll: false,)
              ),
              Transform.translate(
                  offset: Offset(0, -60),
                  child: EveryoneSTrackListSingleLine(trackList: everyoneSTrackList.sublist(10, min(everyoneSTrackList.length, 15)), reverseScroll: true,)
              ),
            ],
          )
        ],
      ),
    );
  }
}
