import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/calander/odos_calander.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_add_button.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_goal_list.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class GoalPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
    throw UnimplementedError();
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 20,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("images/image_user_profile_gorani.jpg")
                    ),
                  ),
                  Text("고라니's 목표", style: profileCardHead,)
                ],
              ),
            ),
            ODOSCalander(dateOffset: 6, dateNum: 31),
            Text("내 목표", style: head2,),
            ODOSGoalList(imoji: "images/icon_fire.png", circleColor: AppColors.greenBackground, my_goal: "목표", percent: .375),
            ODOSGoalList(imoji: "images/icon_fire.png", circleColor: AppColors.redBackground, my_goal: "목표", percent: 1),
            ODOSGoalList(imoji: "images/icon_fire.png", circleColor: AppColors.redBackground, my_goal: "목표", percent: 1),
            ODOSGoalList(imoji: "images/icon_fire.png", circleColor: AppColors.redBackground, my_goal: "목표", percent: 1),
            ODOSAddButton(buttonColor: Colors.black),
          ],
        ),
      ),
    );
  }

}