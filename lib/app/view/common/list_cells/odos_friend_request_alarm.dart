import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';

class ODOSFriendRequestAlarm extends StatelessWidget {
  final String friendName;
  const ODOSFriendRequestAlarm({
    super.key,
    required this.friendName
  });

  @override
  Widget build(BuildContext context) {
    return BaseODOSFriendRequestAlarm(
      widgetList: [
        SizedBox(height: 15.h,),
        friendRequestMessage(friendName),
        SizedBox(height: 10.h,),
        buttonRow(),
        SizedBox(height: 5.h,)
      ],
    );
  }
}

class BaseODOSFriendRequestAlarm extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseODOSFriendRequestAlarm({
    super.key,
    required this.widgetList
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      // height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [odosShadow]
      ),
      child: Column(
        children: widgetList,
      ),
    );
  }
}

Widget friendRequestMessage(String friendName){
  return Row(
    children: [
      Icon(
        Icons.person_add_alt,
        color: Color(0xFF9F9F9F),
        size: 22.w,
      ),
      SizedBox(width: 15.w,),
      Flexible(
        child: Text(
          '${friendName}님이 친구 요청을 보냈어요.',
          style: listCellTextStyle
        ),
      ),
    ],
  );
}

Widget buttonRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      acceptButton(),
      SizedBox(width: 5.w,),
      refuseButton()
    ],
  );
}

Widget acceptButton(){
  return Container(
    width: 50.w,
    height: 30.h,
    decoration: BoxDecoration(
      color: AppColors.gray100,
      borderRadius: BorderRadius.circular(8.w)
    ),
    child: TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 5.h)
      ),
      onPressed: (){
        //TODO: 수락 기능 및 알람 목록에서 삭제
      },
      child: Text(
        '수락',
        style: listCellTextStyle,
      )
    ),
  );
}

Widget refuseButton(){
  return Container(
    width: 50.w,
    height: 30.h,
    decoration: BoxDecoration(
        color: Color(0xFFFFE0E0),
        borderRadius: BorderRadius.circular(8.w)
    ),
    child: TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 5.h)
      ),
      onPressed: (){
        //TODO: 거절 기능 및 알람 목록에서 삭제
      },
      child: Text(
        '거절',
        style: listCellRefuseButtonTextStyle,
      )
    ),
  );
}