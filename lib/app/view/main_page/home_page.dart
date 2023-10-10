import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/home_page_controller.dart';
import 'package:one_day_one_something/app/view/common/track/odos_track_card_list.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_my_goal.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends BaseView<HomePageController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColors.white;
  }

  @override
  Widget body(BuildContext context) {
    return BaseHomePage(
      everyoneSGoalList: controller.everyoneSGoalList,
      everyoneSTrackList: controller.everyoneSTrackList
    );
  }
}

class BaseHomePage extends StatelessWidget {
  final List everyoneSGoalList;
  final List everyoneSTrackList;
  const BaseHomePage(
      {super.key,
      required this.everyoneSGoalList,
      required this.everyoneSTrackList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: UniqueKey(),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              everyoneSTrackList.isEmpty ?
              Center(
                child: Text(AppString.str_empty_track_list, style: everyoneSGoalButtonTextStyle,),
              ) : ODOSTrackCardList(everyoneSTrackList: everyoneSTrackList,)
            ],
          ),
        ],
      ),
    );
  }
}
