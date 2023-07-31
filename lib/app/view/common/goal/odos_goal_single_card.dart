import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSGoalCard extends StatelessWidget {
  final Color goalColor;
  final List<bool> doneWeek;
  final int stackDay;
  final int totalDay;

  const ODOSGoalCard(
      {required this.goalColor,
      required this.doneWeek,
      required this.stackDay,
      required this.totalDay});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [],
    );
  }
}
