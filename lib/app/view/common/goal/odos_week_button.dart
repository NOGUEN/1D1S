import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ODOSWeekButton extends StatelessWidget {
  final Color circleColor;
  final List<bool> doneWeek;

  const ODOSWeekButton({
    required this.circleColor,
    required this.doneWeek,
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
        Text(dayName, style: TextStyle(fontSize: 12, color: Colors.black)),
        SizedBox(height: 10),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDone ? circleColor : Colors.grey,
          ),
          child: isDone
              ? Center(
                  child: SvgPicture.asset(
                    'assets/check_icon.svg', // 체크 아이콘 이미지 파일 경로
                    width: 13.56,
                    height: 9.79,
                    color: Colors.white,
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
