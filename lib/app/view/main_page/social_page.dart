import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/home_page_controller.dart';
import 'package:one_day_one_something/app/view/theme/app_string.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_my_goal.dart';
import 'package:one_day_one_something/app/view/common/track/odos_track_card.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'dart:math';

class SocialPage extends BaseView<HomePageController> {
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
        everyoneSTrackList: controller.everyoneSTrackList);
  }
}

class EveryoneSTrackListSingleLine extends StatelessWidget {
  final List trackList;
  final bool reverseScroll;
  final int duration;
  const EveryoneSTrackListSingleLine(
      {super.key,
      required this.trackList,
      required this.reverseScroll,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      delay: Duration(seconds: 0),
      duration: Duration(
          seconds: duration * (trackList.length < 3 ? 12 : 6)), //1개당 1.5초가 적당
      duplicateChild: trackList.length < 3 ? 8 : 4,
      reverseScroll: reverseScroll,
      gap: 0,
      scrollDirection: Axis.horizontal,
      enableScrollInput: false,
      child: Container(
        clipBehavior: Clip.none,
        height: 140,
        child: Row(
            children: trackList
                .map((trackCard) => ODOSTrackCard(
                        trackColor: trackCard["trackColor"],
                        trackIcon: trackCard["trackIcon"],
                        userProfileImage: trackCard["userProfileImage"],
                        userName: trackCard["userName"])
                    .marginOnly(right: 12))
                .toList()),
      ),
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
              Padding(
                //모두의 목표 버튼
                padding: const EdgeInsets.fromLTRB(16, 21, 0, 0),
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () {},
                  child: Text(AppString.str_everyone_s_goal_button,
                      style: everyoneSGoalButtonTextStyle),
                ),
              ),
              SizedBox(
                //모두의 목표 리스트
                height: 140,
                child: everyoneSGoalList.isEmpty
                    ? Center(
                        child: Text(
                          AppString.str_empty_goal_list,
                          style: everyoneSGoalButtonTextStyle,
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.fromLTRB(24, 20, 24, 20),
                        clipBehavior: Clip.none,
                        physics: ClampingScrollPhysics(),
                        itemCount: everyoneSGoalList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ODOSMyGoal(
                                  consecutive_days: everyoneSGoalList[index]
                                      ["consecutive_days"],
                                  my_goal: everyoneSGoalList[index]["my_goal"],
                                  imoji: 'images/icon_fire.png')
                              .marginOnly(right: 17);
                        },
                      ),
              ),
              Padding(
                //모두의 기록 버튼
                padding: const EdgeInsets.fromLTRB(16, 21, 0, 20),
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.transparent)),
                  onPressed: () {},
                  child: Text(AppString.str_everyone_s_track_button,
                      style: everyoneSGoalButtonTextStyle),
                ),
              ),
              everyoneSTrackList.isEmpty
                  ? Center(
                      child: Text(
                        AppString.str_empty_track_list,
                        style: everyoneSGoalButtonTextStyle,
                      ),
                    )
                  : Column(
                      //모두의 기록 리스트
                      children: [
                        Transform.translate(
                            offset: Offset(0, -20),
                            child: EveryoneSTrackListSingleLine(
                              trackList: everyoneSTrackList.sublist(
                                  0, min(everyoneSTrackList.length, 5)),
                              reverseScroll: true,
                              duration: min(5, (everyoneSTrackList.length - 0)),
                            )),
                        everyoneSTrackList.length > 5
                            ? Transform.translate(
                                offset: Offset(0, -40),
                                child: EveryoneSTrackListSingleLine(
                                  trackList: everyoneSTrackList.sublist(
                                      5, min(everyoneSTrackList.length, 10)),
                                  reverseScroll: false,
                                  duration:
                                      min(5, (everyoneSTrackList.length - 5)),
                                ))
                            : SizedBox.shrink(),
                        everyoneSTrackList.length > 10
                            ? Transform.translate(
                                offset: Offset(0, -60),
                                child: EveryoneSTrackListSingleLine(
                                  trackList: everyoneSTrackList.sublist(
                                      10, min(everyoneSTrackList.length, 15)),
                                  reverseScroll: true,
                                  duration:
                                      min(5, (everyoneSTrackList.length - 10)),
                                ))
                            : SizedBox.shrink(),
                      ],
                    )
            ],
          ),
        ],
      ),
    );
  }
}
