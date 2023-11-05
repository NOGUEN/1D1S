import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ODOSWeekButton extends StatelessWidget {
  final List<bool> doneWeek;
  final Color goalColor;

  const ODOSWeekButton({
    required this.doneWeek,
    required this.goalColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (index) => _buildDayWidget(index)),
    );
  }

  Widget _buildDayWidget(int dayIndex) {
    String dayName = _getDayName(dayIndex);
    bool isDone = doneWeek[dayIndex];

    return Column(
      children: [
        Text(dayName, style: TextStyle(fontSize: 12.sp, color: AppColors.white)),
        SizedBox(height: 10),
        Container(
          width: 28.04,
          height: 28.74,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone ? AppColors.white.withOpacity(0.8) : AppColors.white.withOpacity(0.3),
            boxShadow: isDone
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // 25% opacity for black color
                    offset: Offset(0, 0),
                    blurRadius: 4,
                    spreadRadius: 0.1,
                  )
                ]
                : null,  // or an empty list if you prefer: []
          ),
          child: isDone
              ? Center(
                  child: SvgPicture.asset(
                    'assets/check_icon.svg', // 체크 아이콘 이미지 파일 경로
                    width: 10.86.w,
                    height: 8.04.h,
                    color: goalColor
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }

  String _getDayName(int dayIndex) {
    // switch (dayIndex) {
    //   case 0:
    //     return 'MON';
    //   case 1:
    //     return 'TUE';
    //   case 2:
    //     return 'WED';
    //   case 3:
    //     return 'THU';
    //   case 4:
    //     return 'FRI';
    //   case 5:
    //     return 'SAT';
    //   case 6:
    //     return 'SUN';
    //   default:
    //     return '';
    // }
    switch (dayIndex) {
      case 0:
        return '월';
      case 1:
        return '화';
      case 2:
        return '수';
      case 3:
        return '목';
      case 4:
        return '금';
      case 5:
        return '토';
      case 6:
        return '일';
      default:
        return '';
    }
  }
}
