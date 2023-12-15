import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_add_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ODOSAddButton extends StatelessWidget {
  final Color buttonColor;

  const ODOSAddButton({
    required this.buttonColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.defaultBackground,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(10.r),
        dashPattern: [15.w, 15.h],
        color: Colors.grey,
        strokeWidth: 3,
        child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CustomDialogBox();
                });
          },
          child: Center(
            child: Image.asset(
              'images/icon_add.png',
              width: 45,
              height: 45,
            ),
          ),
        ),
      ),
    );
  }
}
