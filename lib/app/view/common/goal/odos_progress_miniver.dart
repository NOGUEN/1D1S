import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ODOSProgressMiniCircle extends StatelessWidget {
  final double percent;

  const ODOSProgressMiniCircle({
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularStepProgressIndicator(
          totalSteps: 100,
          currentStep: (percent * 100).toInt(),
          stepSize: 6,
          selectedColor: AppColors.white,
          unselectedColor: AppColors.black.withOpacity(0.1),
          padding: 0,
          width: 60.h,
          height: 60.h,
          // selectedStepSize: 15,
          roundedCap: (_, __) => true,
        ),
        Text(
          '${(1000 * percent).toInt() / 10}%',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
