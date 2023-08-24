import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';

class ODOSProfileCard extends StatelessWidget {
  final String userName;
  final String userProfileImage;
  final int longestStreakNumber;
  final int successfulGoalNumber;
  final String aboutMe;

  const ODOSProfileCard({
    super.key,
    required this.userName,
    required this.userProfileImage,
    required this.longestStreakNumber,
    required this.successfulGoalNumber,
    required this.aboutMe
  });

  @override
  Widget build(BuildContext context) {
    return BaseProfileCard(
      widgetList: [
        profileInfoContainer(),
        dividingLine(),
        aboutMeContainer(aboutMe)
      ]
    );
  }

  Widget profileInfoContainer(){
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profileImage(userProfileImage),
          Container(
            height: 100,
            margin: EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileHead(userName),
                maxStreak(longestStreakNumber),
                successfulGoal(successfulGoalNumber)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BaseProfileCard extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseProfileCard({super.key, required this.widgetList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 279,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                spreadRadius: 0.1,
                blurRadius: 20
            )
          ]
      ),
      child: Column(
        children: widgetList
      ),
    );
  }
}

Widget space({height}){
  return SizedBox(height: height);
}

Widget profileImage(String userProfileImage){
  return Container(  // *Profile Image*
    margin: EdgeInsets.only(left: 15),
    child: CircleAvatar(
      backgroundColor: AppColors.black,
      radius: 60.0, //외부 원의 반지름
      child: CircleAvatar(
        backgroundImage: AssetImage(userProfileImage),
        radius: 57.0, //내부 원의 반지름
      ),
    ),
  );
}

Widget profileHead(String userName){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(userName, style: profileCardHead),
      editButton()
    ],
  );
}

Widget maxStreak(int longestStreakNumber){
  return Row(
    children: [
      Text('최고 스트릭', style: profileCardRecordHead),
      Container(
          width: 47,
          margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
          child: Text('$longestStreakNumber일', style: profileCardRecordContent)
      ),
      Image.asset(
        'images/icon_fire.png',
        width: 16,
        height: 16,
      )
    ],
  );
}

Widget successfulGoal(int successfulGoalNumber){
  return Row(  // *Successful Goal*
    children: [
      Text('성공한 목표', style: profileCardRecordHead),
      Container(
          margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
          child: Text('$successfulGoalNumber개', style: profileCardRecordContent)
      )
    ],
  );
}

Widget dividingLine(){
  return Container(
    margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 1.0,
    color: Color(0xffc8c8c8),
  );
}

Widget aboutMeContainer(String aboutMe){
  return Container(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
          alignment: Alignment.topLeft,
          child:  // *Profile Head*
          Text('자기소개', style: profileCardAboutMeHead),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            aboutMe,  //자기소개는 36자 이하로
            style: profileCardAboutMeContent,
            textAlign: TextAlign.start,
          ),
        )
      ],
    ),
  );
}

Widget editButton() {
  return Container(
    width: 35,
    height: 35,
    alignment: Alignment.center,
    child: IconButton(
        padding: EdgeInsets.all(10),
        onPressed: (){Get.toNamed(Routes.UPDATE_PROFILE);},
        icon: SvgPicture.asset(
          AppString.goal,
          colorFilter: ColorFilter.mode(Color(0xffababab), BlendMode.srcIn),
        )
    ),
  );
}