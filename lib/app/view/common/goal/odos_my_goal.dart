import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSMyGoal extends StatelessWidget {
  final int consecutive_days;
  final String my_goal;
  final String imoji;
  const ODOSMyGoal({super.key, required this.consecutive_days, required this.my_goal, required this.imoji});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width:150,
      height:100,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(2, 0, 10, 0),
                child: Image.asset(
                  imoji,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                my_goal,
                style: trackCardHead,
              ),
            ]
          ),
          Container(
              margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
              child: Text('$consecutive_days일 연속!', style: trackCardHead,))
        ],
      ),
    );
  }
}
