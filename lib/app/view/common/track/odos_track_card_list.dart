import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:one_day_one_something/app/view/common/track/odos_track_card.dart';
import 'dart:math';


class ODOSTrackCardList extends StatelessWidget {
  final List everyoneSTrackList;
  const ODOSTrackCardList(
      {super.key,
      required this.everyoneSTrackList});

  @override
  Widget build(BuildContext context) {
    return Column(   //모두의 기록 리스트
      children: [
        Transform.translate(
            offset: Offset(0, -20.h),
            child: EveryoneSTrackListSingleLine(
              trackList: everyoneSTrackList.sublist(0, min(everyoneSTrackList.length, 5)),
              reverseScroll: true,
              duration: min(5, (everyoneSTrackList.length-0)),
            )
        ),
        everyoneSTrackList.length > 5 ? Transform.translate(
            offset: Offset(0, -40.h),
            child: EveryoneSTrackListSingleLine(
              trackList: everyoneSTrackList.sublist(5, min(everyoneSTrackList.length, 10)),
              reverseScroll: false,
              duration: min(5, (everyoneSTrackList.length-5)),
            )
        ) : SizedBox.shrink(),
        everyoneSTrackList.length > 10 ? Transform.translate(
            offset: Offset(0, -60.h),
            child: EveryoneSTrackListSingleLine(
              trackList: everyoneSTrackList.sublist(10, min(everyoneSTrackList.length, 15)),
              reverseScroll: true,
              duration: min(5, (everyoneSTrackList.length-10)),
            )
        ) : SizedBox.shrink(),
      ],
    );
  }
}

class EveryoneSTrackListSingleLine extends StatelessWidget {
  final List trackList;
  final bool reverseScroll;
  final int duration;
  const EveryoneSTrackListSingleLine({
    super.key,
    required this.trackList,
    required this.reverseScroll,
    required this.duration
  });

  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      delay: Duration(seconds: 0),
      duration: Duration(seconds: duration * (trackList.length < 3 ? 12 : 6)),  //1개당 1.5초가 적당
      duplicateChild: trackList.length < 3 ? 8 : 4,
      reverseScroll: reverseScroll,
      gap: 0,
      scrollDirection: Axis.horizontal,
      enableScrollInput: false,
      child: Container(
        clipBehavior: Clip.none,
        height: 136.h,
        child: Row(
            children: trackList
              .map<Widget>((trackCard) => ODOSTrackCard(
              trackColor: trackCard["trackColor"],
              userProfileImage: trackCard["userProfileImage"],
              userName: trackCard["userName"])
              ).toList()),
      ),
    );
  }
}