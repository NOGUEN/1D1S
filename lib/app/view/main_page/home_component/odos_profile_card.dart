import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

class ODOSHomeProfileCard extends StatelessWidget {
  const ODOSHomeProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppValues.buttonRadius,
        ),
        color: AppColors.white,
        boxShadow: [odosShadow],
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(AppValues.screenPadding),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  AppString.profile[0],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "고라니",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: AppFontWeights.bold,
                  ),
                ),
                Text(
                  "자기소개 어쩌구",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: AppFontWeights.regular,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
