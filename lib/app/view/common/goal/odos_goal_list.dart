import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSGoalList extends StatelessWidget {
  const ODOSGoalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.defaultBackground,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
          children: [
            CircularProgressIndicator(
              strokeWidth: 10,
              value: 0.1,
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.blueBackground, //<-- SEE HERE
              ),
              color: AppColors.gray300
            ),
            Text(
              "🔥 ",
              style: labelTextStyle,
            ),
            Text(
              "내 목표",
              style: labelTextStyle,
            ),

          ]
      ),
    );
  }
}
