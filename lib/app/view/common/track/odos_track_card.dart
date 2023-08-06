import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSTrackCard extends StatelessWidget {
  final Color trackColor;
  final String trackIcon;
  final String userProfileImage;
  final String userName;

  const ODOSTrackCard(
      {super.key,
      required this.trackColor,
      required this.trackIcon,
      required this.userProfileImage,
      required this.userName});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: trackColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 20
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(2, 0, 10, 0),
                child: Image.asset(
                  trackIcon,
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
              ),
              Text('오늘의 기록', style: trackCardHead)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: ClipOval(
                  child: Image.asset(
                    userProfileImage,
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              Text(userName, style: trackCardProfile)
            ],
          )
        ],
      ),
    );
  }
}
