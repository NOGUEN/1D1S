// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';

class GoalPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ListView(
        clipBehavior: Clip.none,
        padding: EdgeInsets.all(20.w),
        children: [],
      ),
    );
  }
}
