import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ODOSProgressCircle extends StatelessWidget {
  final Color circleColor;
  final double percent;

  const ODOSProgressCircle({
    required this.circleColor,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularStepProgressIndicator(
          totalSteps: 100,
          currentStep: (100 * percent).toInt(),
          stepSize: 5,
          selectedColor: circleColor,
          unselectedColor: Colors.grey[200],
          padding: 0,
          width: 50,
          height: 50,
          // selectedStepSize: 15,
          roundedCap: (_, __) => true,
        ),
        Text(
          '${(100 * percent)}%',
          style: TextStyle(
            color: Colors.black,
            fontSize: 8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
