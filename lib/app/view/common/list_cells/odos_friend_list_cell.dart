import 'package:one_day_one_something/app/view/common/profile/profile_image.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';

class ODOSFriendListCell extends StatelessWidget {
  final String friendName;
  final friendsRequestCode;
  const ODOSFriendListCell({
    super.key,
    required this.friendName,
    required this.friendsRequestCode
  });

  @override
  Widget build(BuildContext context) {
    return BaseODOSFriendListCell(
      widgetList: [
        friendProfie('고라니', 'images/image_user_profile_gorani.jpg'),
        friendsRequestCode == FriendsRequestCode.ACCEPT ? friendDeleteButton() :
        friendsRequestCode == FriendsRequestCode.SENT ? friendWaitingButton() :
            friendRequestButton()
      ]
    );
  }
}

class BaseODOSFriendListCell extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseODOSFriendListCell({
    super.key,
    required this.widgetList
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 50.h,
      padding: EdgeInsets.only(left: 13.w, right: 20.w),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [odosShadow]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widgetList,
      ),
    );
  }
}

Widget friendProfie(String friendName, String friendProfileImage){
  return Row(
    children: [
      profileImage(
        userProfileImage: friendProfileImage,
        outerCircleRadius: 15.w,
        innerCircleRadius: 14.5.w
      ),
      SizedBox(width: 14.w,),
      Text(friendName, style: listCellTextStyle,)
    ],
  );
}

Widget friendRequestButton(){
  return Container(
    width: 80.w,
    height: 30.h,
    decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(8.w)
    ),
    child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h)
        ),
        onPressed: (){
          //TODO: 친구 요청 기능 및 stat 변경을 통한 수락 대기중 버튼으로의 변경
        },
        child: Text(
          '친구 요청',
          style: listCellTextStyle,
        )
    ),
  );
}

Widget friendWaitingButton(){
  return Container(
    width: 90.w,
    height: 30.h,
    decoration: BoxDecoration(
        color: AppColors.gray100,
        borderRadius: BorderRadius.circular(8.w)
    ),
    child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 4.5.w, vertical: 5.h)
        ),
        onPressed: null,
        child: Text(
          '수락 대기중',
          style: listCellDisabledButtonTextStyle,
        )
    ),
  );
}

Widget friendDeleteButton(){
  return Container(
    width: 80.w,
    height: 30.h,
    decoration: BoxDecoration(
        color: Color(0xFFFFE0E0),
        borderRadius: BorderRadius.circular(8.w)
    ),
    child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h)
        ),
        onPressed: (){
          //TODO: 친구 삭제 기능 및 친구 리스트에서 삭제
        },
        child: Text(
          '친구 삭제',
          style: listCellRefuseButtonTextStyle,
        )
    ),
  );
}