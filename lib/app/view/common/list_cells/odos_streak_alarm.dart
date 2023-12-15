import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ODOSStreakAlarm extends StatelessWidget {
  final int streakNumber;
  const ODOSStreakAlarm({super.key, required this.streakNumber});

  @override
  Widget build(BuildContext context) {
    return BaseODOSStreakAlarm(widgetList: [
      SvgPicture.asset(
        'assets/dab_icon.svg',
        width: 19.w,
        height: 19.w,
        colorFilter: const ColorFilter.mode(Color(0xFF9F9F9F), BlendMode.color),
      ),
      SizedBox(
        width: 18.w,
      ),
      Text(
        '스트릭 $streakNumber일 달성!',
        style: listCellTextStyle,
      )
    ]);
  }
}

class BaseODOSStreakAlarm extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseODOSStreakAlarm({super.key, required this.widgetList});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 50.h,
      padding: EdgeInsets.only(left: 20.w),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [odosShadow]),
      child: Row(
        children: widgetList,
      ),
    );
  }
}
