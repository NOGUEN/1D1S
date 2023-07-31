import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
class ODOSGoalList extends StatelessWidget {
  final String imoji;
  final String my_goal;
  final Color circleColor;
  final double percent;
  const ODOSGoalList({super.key, required this.imoji, required this.circleColor, required this.my_goal, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:361,
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.defaultBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: Offset(0, 0),
              spreadRadius: 0.1,
              blurRadius: 20
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ODOSProgressCircle(
            circleColor: AppColors.gray700,
            percent: 0.5,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Image.asset(
              imoji,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Text(
              my_goal,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              style: goalListHead,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Image.asset(
              'images/icon_add.png',
              width: 45,
              height: 45,
            ),
          ),
          IconButton(
            color: AppColors.gray500,
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              // > 버튼을 눌렀을 때 동작
            },
          ),
        ],
      ),
    );
  }
}
