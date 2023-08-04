import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ODOSProgressMiniCircle extends StatelessWidget {
  final Color circleColor;
  final double percent;

  const ODOSProgressMiniCircle({
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
          currentStep: (percent * 100).toInt(),
          stepSize: 6,
          selectedColor: circleColor,
          unselectedColor: Colors.grey[200],
          padding: 0,
          width: 50,
          height: 50,
          // selectedStepSize: 15,
          roundedCap: (_, __) => true,
        ),
        Text(
          '${(1000 * percent).toInt() / 10}%',
          style: TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
