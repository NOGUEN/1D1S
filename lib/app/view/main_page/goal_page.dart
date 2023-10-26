import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_day_one_something/app/data/firebase/constants/constants.dart';

class GoalPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final userid = FirebaseAuth.instance.currentUser!.uid;

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userid)
          .snapshots(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loader while data is loading
        }

        if (userSnapshot.hasError) {
          return Text('Error: ${userSnapshot.error}');
        }

        final userData = userSnapshot.data;
        final userNickname = userData?['nickname'];
        final userProfile = userData?['profileImageNumber'];
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(userid)
              .collection('goallist')
              .where("goal_complete", isEqualTo: false)
              .snapshots(),
          builder: (context, snapshot) {
            List<ODOSGoalList> goalWidgets = [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('snapshot.hasError Error: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Text('No data available.');
            }

            if (snapshot.hasData) {
              final goals = snapshot.data?.docs.reversed.toList();
              for (var eachgoal in goals!) {
                double percent;

                if (eachgoal['goal_streak'] != 0) {
                  percent = (eachgoal['goal_streak'] /
                      dayEnum[eachgoal['goal_days']]);
                } else {
                  percent = 0.0;
                }

                final goalwidget = ODOSGoalList(
                  emojiIndex: eachgoal['goal_emoji'],
                  circleColor:
                      AppColors.getColorByIndex(eachgoal['goal_color']),
                  my_goal: eachgoal['goal_name'],
                  percent: percent,
                  d_id: eachgoal.id,
                );

                goalWidgets.add(goalwidget);
              }
              goalWidgets.sort((a, b) =>
                  b.percent.compareTo(a.percent)); //percent 높은 순으로 정렬.
            }
            return Row(
              children: [
                Expanded(
                  child: ListView(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.all(20),
                    children: [
                      Center(
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
                                        backgroundImage:
                                            AssetImage(imagepath[userProfile])),
                                  ),
                                  Text(
                                    '$userNickname\'s 목표', // Use the user's nickname
                                    style: profileCardHead,
                                  )
                                ],
                              ),
                            ),
                            ODOSCalander(dateOffset: 6, dateNum: 31),
                            Text(
                              "내 목표",
                              style: head2,
                            ),
                            ...goalWidgets,
                            ODOSAddButton(buttonColor: Colors.black),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
