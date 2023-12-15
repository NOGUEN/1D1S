// ignore_for_file: camel_case_types

import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:flutter/material.dart';

class profileImage extends StatelessWidget {
  final String userProfileImage;
  final double outerCircleRadius;
  final double innerCircleRadius;
  const profileImage(
      {super.key,
      required this.userProfileImage,
      required this.outerCircleRadius,
      required this.innerCircleRadius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.black,
      radius: outerCircleRadius, //외부 원의 반지름
      child: CircleAvatar(
        backgroundImage: AssetImage(userProfileImage),
        radius: innerCircleRadius, //내부 원의 반지름
      ),
    );
  }
}
