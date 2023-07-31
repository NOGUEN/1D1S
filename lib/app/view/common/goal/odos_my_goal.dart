import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSMyGoal extends StatelessWidget {
  const ODOSMyGoal({super.key});

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
              spreadRadius: 2,
              blurRadius: 20
          ),
          BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4
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
                  'images/icon_fire.png',
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "내 목표",
                style: trackCardHead,
              ),
            ]
          ),
          Container(
              margin: EdgeInsets.fromLTRB(2, 0, 0, 0),
              child: Text('20일 연속!', style: trackCardHead,))
        ],
      ),
    );
  }
}
