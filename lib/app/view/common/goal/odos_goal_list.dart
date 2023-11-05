import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_popup_menu_button.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_progress_miniver.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_fast_record.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<String> emojis = [
  'images/icon_add.png',
  'images/icon_blue_book.png',
  'images/icon_fire.png',
  // Add more emoji URLs or paths as needed
];

class ODOSGoalList extends StatelessWidget {
  final int emojiIndex;
  final String my_goal;
  final Color circleColor;
  final double percent;
  final String d_id;
  const ODOSGoalList(
      {super.key,
      required this.emojiIndex,
      required this.circleColor,
      required this.my_goal,
      required this.percent,
      required this.d_id
      required this.isBookmarked,
      required this.recordDialogBox
       });
  
  @override
  Widget build(BuildContext context) {
    return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             circleColor,
//             Color.lerp(AppColors.defaultBackground, circleColor,
//                 pow(percent, 6).toDouble())!
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment(percent, 0),
        width: 320.w,
        height: 120.h,
        padding: EdgeInsets.only(left: 15.w, top: 14.h, right: 20.w, bottom: 11.h),
        decoration: BoxDecoration(
          color: circleColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                offset: Offset(0, 0),
                spreadRadius: 0.1,
                blurRadius: 20)
          ],
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: widgetList,
      )
    );
  }
}

Widget goalTitle({my_goal}){
  return Container(
    child: Text(
      my_goal,
      overflow: TextOverflow.fade,
      maxLines: 1,
      softWrap: false,
      style: goalListHead,
    ),
  );
}

Widget buttonContainer({isBookmarked}){
  return Container(
    alignment: Alignment.topRight,
    child: Row(
      children: [
        isBookmarked ? starButton() : SizedBox.shrink(),
        ODOSPopupMenuButton()
      ],
    ),
  );
}

Widget starButton(){
  return Container(
      width: 24.w,
      height: 20.h,
      // color: Colors.red,
      child: IconButton(
        padding: EdgeInsets.all(0),
        color: AppColors.white,
        icon: SvgPicture.asset(
          'assets/star_icon.svg',
          width: 19.w,
          height: 19.w,
          color: Colors.white,
        ),
        onPressed: () {
          // star 버튼을 눌렀을 때 동작
        },
      )
  );
}

Widget currentStreak({consecutive_days}){
  return Text(
    '$consecutive_days일 연속',
    style: goalListStackDay,
  );
}

Widget addRecordButton({context, required Widget recordDialogBox}){
  return Container(  //기록 추가 button
    width: 100.w,
    height: 30.h,
    decoration: BoxDecoration(
      color: AppColors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(15.h),
    ),
    child: TextButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return recordDialogBox;
            }
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//           ODOSProgressMiniCircle(
//             circleColor: circleColor,
//             percent: percent,
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//             child: Image.asset(
//               emojis[emojiIndex],
//               width: 25,
//               height: 25,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Text(
//               my_goal,
//               overflow: TextOverflow.fade,
//               maxLines: 1,
//               softWrap: false,
//               style: goalListHead,
//             ),
//           ),
//           SizedBox(
//             width: 60,
//             height: 60,
//             child: IconButton(
//               onPressed: () {
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return recordDialogBox(
//                         my_goal: my_goal,
//                         doc_id: d_id,
//                         );
//                     });
//                 // Add your onPressed function here
//               },
//               icon: Image.asset(
//                 'images/icon_add.png',
//                 width: 60,
//                 height: 60,
//               ),
//             ),
//           ),
//           IconButton(
//             color: AppColors.gray500,
//             icon: Icon(Icons.arrow_forward_ios),
//             onPressed: () {
//               // > 버튼을 눌렀을 때 동작
//             },
//           ),
          Text("기록 추가 ", style: goalListAddRecordButton),
          Text("+", style: goalListAddRecordButtonIcon)
        ],
      ),
    ),
  );
}