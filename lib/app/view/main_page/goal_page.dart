import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/calander/odos_calander.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_add_button.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_fast_record.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_list.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

const List exampleList = [
  {
    "goalId": "1",
    "goalColor": AppColors.goalPinkBackground,
    "my_goal": "목표 이름1",
    "consecutive_days": 10,
    "total_days": 30,
    "isBookmarked": true
  },
  {
    "goalId": "2",
    "goalColor": AppColors.goalYellowBackground,
    "my_goal": "목표 이름2",
    "consecutive_days": 15,
    "total_days": 30,
    "isBookmarked": false
  },
  {
    "goalId": "3",
    "goalColor": AppColors.goalGreenBackground,
    "my_goal": "목표 이름3",
    "consecutive_days": 20,
    "total_days": 30,
    "isBookmarked": false
  },
  {
    "goalId": "4",
    "goalColor": AppColors.goalBlueBackground,
    "my_goal": "목표 이름4",
    "consecutive_days": 30,
    "total_days": 30,
    "isBookmarked": false
  },
];

class SocialPage extends GetView<MainController> {
  const SocialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBody(widgetList: []);
  }
}

class BaseBody extends StatelessWidget {
  final ScrollController? scrollController;
  final List<Widget> widgetList;

  double? columnHeight = 640.h;

  BaseBody({
    this.scrollController,
    required this.widgetList,
    this.columnHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
        width: double.infinity,
        child: SingleChildScrollView(
          controller: scrollController,
          child: SizedBox(
            height: columnHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widgetList,
            ),
          ),
        ),
      ),
    );
  }
}
