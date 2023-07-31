import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_bottom_navigationbar.dart';
import 'package:one_day_one_something/app/view/common/system/odos_buttons.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_circle.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_week_button.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

import '../controller/main/main_controller.dart';

class MainPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const ODOSAppBar();
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: const [
        ODOSConfirmButton(buttonColor: AppColors.black),
        ODOSTextField(),
        ODOSSubButton(),
        ODOSProgressCircle(
          circleColor: AppColors.black,
          percent: 0.754,
        ),
        ODOSWeekButton(
          circleColor: AppColors.black,
          doneWeek: [true, false, true, false, false, true, true],
        )
      ],
    );
  }

  Widget? bottomNavigationBar() {
    return ODOSBottomNavigationBar(
        onNewMenuSelected: controller.onMenuSelected);
  }
}
