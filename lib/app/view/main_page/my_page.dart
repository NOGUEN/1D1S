import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/my_page_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_multi_card.dart';
import 'package:one_day_one_something/app/view/common/profile/odos_profile_card.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class MyPage extends BaseView<MyPageController> {
  @override
  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      resizeToAvoidBottomInset: false,
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      bottomSheet: bottomSheet(),
      drawer: drawer(),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return BaseMyPage(
      cardlist: controller.cardlist,
      userName: controller.userName.value,
      userProfileImage: controller.userProfileImage.value,
      longestStreakNumber: controller.longestStreakNumber.value,
      numberOfFriends: controller.numberOfFriends.value,
      aboutMe: controller.aboutMe.value,
    );
  }
}

class BaseMyPage extends StatelessWidget {
  final List<dynamic> cardlist;
  final String userName;
  final String userProfileImage;
  final int longestStreakNumber;
  final int numberOfFriends;
  final String aboutMe;
  const BaseMyPage(
      {super.key,
      required this.cardlist,
      required this.userName,
      required this.userProfileImage,
      required this.longestStreakNumber,
      required this.numberOfFriends,
      required this.aboutMe});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      ODOSProfileCard(
              userName: userName,
              userProfileImage: userProfileImage,
              longestStreakNumber: longestStreakNumber,
              numberOfFriends: numberOfFriends,
              aboutMe: aboutMe)
          .marginOnly(left: 20, right: 20, top: 21, bottom: 8),
      GoalMulticard(cardlist: cardlist),
    ]));
  }
}
