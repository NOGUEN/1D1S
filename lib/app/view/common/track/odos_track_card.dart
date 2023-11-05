import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';

class ODOSTrackCard extends StatelessWidget {
  final Color trackColor;
  final String userProfileImage;
  final String userName;

  const ODOSTrackCard(
      {super.key,
      required this.trackColor,
      required this.userProfileImage,
      required this.userName});


  @override
  Widget build(BuildContext context) {
    return BaseTrackCard(
      widgetList: [
        trackTitle(),
        trackProfile(
          userProfileImage: userProfileImage,
          userName: userName
        )
      ],
      trackColor: trackColor
    );
  }
}

class BaseTrackCard extends StatelessWidget {
  final List<Widget> widgetList;
  final Color trackColor;
  const BaseTrackCard({
    super.key,
    required this.widgetList,
    required this.trackColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:23.w, top: 18.h, right: 23.w, bottom: 15.h),
      margin: EdgeInsets.only(right: 12.w),
      width: 150.w,
      height: 100.h,
      decoration: BoxDecoration(
          color: trackColor,
          borderRadius: BorderRadius.circular(8.h),
          boxShadow: [odosShadow]
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgetList
      )
    );
  }
}

Widget trackTitle(){
  return Text('오늘의 기록', style: trackCardHead);
}

Widget trackProfile({userProfileImage, userName}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10.w, 0),
        child: ClipOval(
          child: Image.asset(
            userProfileImage,
            width: 25.w,
            height: 25.w,
          ),
        ),
      ),
      Text(userName, style: trackCardProfile)
    ],
  );
}
