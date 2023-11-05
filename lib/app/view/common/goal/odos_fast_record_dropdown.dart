import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ODOSSelectGoalDropdown extends StatelessWidget {
  final List goalList;
  final String selectedGoalId;
  final Function setSelectedGoalValue;
  const ODOSSelectGoalDropdown({
    super.key,
    required this.goalList,
    required this.selectedGoalId,
    required this.setSelectedGoalValue
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedGoalId,
      icon: SizedBox.shrink(),
      padding: EdgeInsets.zero,
      itemHeight: 60.h,
      underline: SizedBox.shrink(),
      isExpanded: true,
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setSelectedGoalValue(value);
      },
      selectedItemBuilder: (BuildContext context) {
        return goalList.map<Widget>((e) {
          return Container(
              width: 250.w,
              height: 60.h,
              padding: EdgeInsets.only(left: 20.w, top: 15.h, bottom: 15.h),
              decoration: BoxDecoration(
                  color: e["goalColor"],
                  borderRadius: BorderRadius.circular(8.w)
              ),
              child: Text("To > " + e["my_goal"].toString(),
                  style: RecordAddDropdownSelectedItemTextStyle)
          );
        }).toList();
      },
      items: goalList.map((e) {
        return DropdownMenuItem(
          value: e["goalId"].toString(),
          child: Text(e["my_goal"].toString(), style: RecordAddDropdownTextStyle)
        );
      }).toList(),
    );
  }
}

class BaseDropDownMenuItem extends StatelessWidget {
  final String value;
  const BaseDropDownMenuItem({
    super.key,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Text(value, style: RecordAddDropdownTextStyle);
  }
}
