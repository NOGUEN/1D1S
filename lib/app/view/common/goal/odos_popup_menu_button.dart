import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget ODOSPopupMenuButton(){
  return PopupMenuButton(
    itemBuilder: (BuildContext buildContext) => (<PopupMenuItem>[
      basePopupMenuItem('즐겨찾기 해제', 'assets/star_icon.svg', Color(0xFFFFC700), Colors.black),
      basePopupMenuItem('목표 수정하기', 'assets/edit_icon.svg', Colors.black, Colors.black),
      basePopupMenuItem('목표 삭제하기', 'assets/delete_icon.svg', Colors.red, Colors.red),
    ]),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
    ),
    child: Container(
      width: 24.w,
      height: 20.h,
      child: Icon(
        Icons.more_vert,
        size: 20.h,
        color: AppColors.white,
      ),
    ),
  );
}

PopupMenuItem basePopupMenuItem(
    String title,
    String iconFile,
    Color iconColor,
    Color textColor
    ){
  return PopupMenuItem(
      value: title,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            iconFile,
            width: 20.w,
            height: 20.w,
            color: iconColor,
          ),
          Text(
            title,
            style: TextStyle(
                color: textColor,
                fontSize: 14.sp,
                fontWeight: AppFontWeights.medium
            ),
          )
        ],
      )
  );
}