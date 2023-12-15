import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_popup_menu_button.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_miniver.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';

class ODOSGoalList extends StatelessWidget {
  final String goalId;
  final Color goalColor;
  final String myGoal;
  final int consecutiveDays;
  final int totalDays;
  final bool isBookmarked;
  final Widget recordDialogBox;
  const ODOSGoalList(
      {super.key,
      required this.goalId,
      required this.goalColor,
      required this.myGoal,
      required this.consecutiveDays,
      required this.totalDays,
      required this.isBookmarked,
      required this.recordDialogBox});

  @override
  Widget build(BuildContext context) {
    return BaseGoalList(
      goalColor: goalColor,
      widgetList: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ODOSProgressMiniCircle(
                    percent: (consecutiveDays / totalDays).toDouble(),
                    //TODO: 소숫점 예외처리,
                  ),
                  SizedBox(width: 17.w),
                  goalTitle(myGoal: myGoal)
                ],
              ),
              buttonContainer(isBookmarked: isBookmarked)
            ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            currentStreak(consecutiveDays: consecutiveDays),
            addRecordButton(context: context, recordDialogBox: recordDialogBox),
          ],
        ),
      ],
    );
  }
}

class BaseGoalList extends StatelessWidget {
  final List<Widget> widgetList;
  final Color goalColor;

  const BaseGoalList(
      {super.key, required this.widgetList, required this.goalColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.w,
        height: 120.h,
        padding:
            EdgeInsets.only(left: 15.w, top: 14.h, right: 20.w, bottom: 11.h),
        decoration: BoxDecoration(
          color: goalColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [odosShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgetList,
        ));
  }
}

Widget goalTitle({myGoal}) {
  return Text(
    myGoal,
    overflow: TextOverflow.fade,
    maxLines: 1,
    softWrap: false,
    style: goalListHead,
  );
}

Widget buttonContainer({isBookmarked}) {
  return Container(
    alignment: Alignment.topRight,
    child: Row(
      children: [
        isBookmarked ? starButton() : const SizedBox.shrink(),
        const ODOSPopUpMenuButton()
      ],
    ),
  );
}

Widget starButton() {
  return SizedBox(
      width: 24.w,
      height: 20.h,
      // color: Colors.red,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        color: AppColors.white,
        icon: SvgPicture.asset(
          'assets/star_icon.svg',
          width: 19.w,
          height: 19.w,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.color),
        ),
        onPressed: () {
          // star 버튼을 눌렀을 때 동작
        },
      ));
}

Widget currentStreak({consecutiveDays}) {
  return Text(
    '$consecutiveDays일 연속',
    style: goalListStackDay,
  );
}

Widget addRecordButton({context, required Widget recordDialogBox}) {
  return Container(
    //기록 추가 button
    width: 100.w,
    height: 30.h,
    decoration: BoxDecoration(
      color: AppColors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15.r),
    ),
    child: TextButton(
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return recordDialogBox;
            });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("기록 추가 ", style: goalListAddRecordButton),
          Text("+", style: goalListAddRecordButtonIcon)
        ],
      ),
    ),
  );
}
