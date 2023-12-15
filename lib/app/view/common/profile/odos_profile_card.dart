import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';
import 'package:one_day_one_something/app/view/common/profile/profile_image.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';

class ODOSProfileCard extends StatelessWidget {
  final String userName;
  final String userProfileImage;
  final int longestStreakNumber;
  final int numberOfFriends;
  final String aboutMe;

  const ODOSProfileCard(
      {super.key,
      required this.userName,
      required this.userProfileImage,
      required this.longestStreakNumber,
      required this.numberOfFriends,
      required this.aboutMe});

  @override
  Widget build(BuildContext context) {
    return BaseProfileCard(widgetList: [
      profileInfoContainer(),
      dividingLine(),
      aboutMeContainer(aboutMe)
    ]);
  }

  Widget profileInfoContainer() {
    return Container(
      height: 140.h,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
          ),
          profileImage(
              userProfileImage: userProfileImage,
              outerCircleRadius: 50.r,
              innerCircleRadius: 48.r),
          Container(
            height: 100.h,
            margin: EdgeInsets.only(left: 12.5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileHead(userName),
                maxStreak(longestStreakNumber),
                friends(numberOfFriends)
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
      width: 320.w,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.w),
          border:
              Border.all(color: AppColors.profileCardBorderColor, width: 3.w),
          boxShadow: [odosShadow]),
      child: Column(children: widgetList),
    );
  }
}

Widget space({height}) {
  return SizedBox(height: height);
}

Widget profileHead(String userName) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [Text(userName, style: profileCardHead), editButton()],
  );
}

Widget maxStreak(int longestStreakNumber) {
  return Row(
    children: [
      Text('최고 스트릭', style: profileCardRecordHead),
      Container(
          width: 47.w,
          margin: EdgeInsets.only(left: 7.7.w),
          child:
              Text('$longestStreakNumber일', style: profileCardRecordContent)),
      Image.asset(
        'images/icon_fire.png',
        width: 16.h,
        height: 16.h,
      )
    ],
  );
}

Widget friends(int numberOfFriends) {
  return TextButton(
    // *Successful Goal*
    style: TextButton.styleFrom(
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    onPressed: () {},
    child: Text('친구 $numberOfFriends명 >', style: profileCardRecordHead),
  );
}

Widget dividingLine() {
  return Container(
    width: 302.w,
    height: 1.0.h,
    color: const Color(0xFFc8c8c8),
  );
}

Widget aboutMeContainer(String aboutMe) {
  return Container(
    padding: EdgeInsets.fromLTRB(17.7.w, 15.h, 17.7.w, 0),
    height: 110.h,
    child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: // *Profile Head*
              Text('자기소개', style: profileCardAboutMeHead),
        ),
        space(height: 8.h),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            aboutMe, //자기소개는 36자 이하로
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
    width: 35.w,
    height: 35.h,
    alignment: Alignment.center,
    child: IconButton(
        padding: EdgeInsets.all(8.h),
        onPressed: () {
          Get.toNamed(Routes.UPDATE_PROFILE);
        },
        icon: SvgPicture.asset(
          AppString.goal,
          colorFilter:
              const ColorFilter.mode(Color(0xffababab), BlendMode.srcIn),
        )),
  );
}
