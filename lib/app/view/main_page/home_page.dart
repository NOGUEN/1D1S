// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/controller/main/home_page_controller.dart';
import 'package:one_day_one_something/app/view/common/list_cells/odos_friend_list_cell.dart';
import 'package:one_day_one_something/app/view/common/list_cells/odos_friend_request_alarm.dart';
import 'package:one_day_one_something/app/view/common/list_cells/odos_streak_alarm.dart';
import 'package:one_day_one_something/app/view/common/track/odos_track_card_list.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class HomePage extends BaseView<HomePageController> {
  ScrollController scrollController;

  HomePage({required this.scrollController});

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
      everyoneSTrackList: controller.everyoneSTrackList,
      scrollController: scrollController,
    );
  }
}

class BaseHomePage extends StatelessWidget {
  final List everyoneSGoalList;
  final List everyoneSTrackList;
  final ScrollController scrollController;
  const BaseHomePage({
    super.key,
    required this.everyoneSGoalList,
    required this.everyoneSTrackList,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: UniqueKey(),
      child: ListView(
        controller: scrollController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: const ODOSFriendRequestAlarm(
                  friendName: '고라니',
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const ODOSStreakAlarm(streakNumber: 50)),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: const ODOSFriendListCell(
                  friendName: '고라니',
                  friendsRequestCode: FriendsRequestCode.RECEIVED,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: const ODOSFriendListCell(
                  friendName: '고라니',
                  friendsRequestCode: FriendsRequestCode.SENT,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: const ODOSFriendListCell(
                  friendName: '고라니',
                  friendsRequestCode: FriendsRequestCode.ACCEPT,
                ),
              ),
              everyoneSTrackList.isEmpty
                  ? const Center(
                      child: Text(
                        AppString.str_empty_track_list,
                        style: everyoneSGoalButtonTextStyle,
                      ),
                    )
                  : ODOSTrackCardList(
                      everyoneSTrackList: everyoneSTrackList,
                    )
            ],
          ),
        ],
      ),
    );
  }
}
