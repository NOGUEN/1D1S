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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';


class GoalPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    final userid = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userid) // Replace 'userID' with the actual user's ID
          .collection('goallist')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loader while data is loading
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No data available.');
        }

        // Process the data from the snapshot and create the ODOSGoalList widgets
        List<Widget> goalListWidgets = snapshot.data!.docs.map((doc) {
          // Assuming your document structure has fields like 'emoji', 'color', 'goalname', 'streak', etc.
          int emoji = doc['goalemoji']?? 0;
          int circleColor = doc['goalcolor']?? 0;
          String myGoal = doc['goalname'] ?? "";
          double percent = doc['goalstreak'] / doc['goaldays'] ?? 1;

          return ODOSGoalList(
            emojiIndex: emoji,
            circleColor: AppColors.getColorByIndex(circleColor),
            my_goal: myGoal,
            percent: percent,
          );
        }).toList();

        return ListView(
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
                            backgroundImage: AssetImage(
                                "images/image_user_profile_gorani.jpg")),
                      ),
                      Text(
                        "고라니's 목표",
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
                  ...goalListWidgets,
                  ODOSAddButton(buttonColor: Colors.black),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: ODOSGoalList(
                              emojiIndex: 2,
                              circleColor: AppColors.getColorByIndex(0),
                              my_goal: "목표",
                              percent: 1,
                            ),
                          );
                        },
                      );
                    },
                    child: Text('hi'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}