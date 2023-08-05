import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field_goalver.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_color_palette.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_icon_picker.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({super.key});

  @override
  State<StatefulWidget> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  static final List<Color> circleColors = [
    AppColors.defaultBackground,
    AppColors.redBackground,
    AppColors.orangeBackground,
    AppColors.yellowBackground,
    AppColors.greenBackground,
    AppColors.blueBackground,
    AppColors.purpleBackground,
  ];

  int selectedColorIndex = 0; // 선택한 색상의 인덱스를 로컬 변수로 추가
  int _selectedDayValue = 2;
  List<String> dayList = ["5", "7", "10", "20", "30", "50", "100"];
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          // width: 551,
          height: 315,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: circleColors[selectedColorIndex], // 동적으로 변경된 색상을 반영
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 5),
                blurRadius: 7,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 11),
              Text(
                "새 목표",
                style: goalNewcardDialog,
              ),
              ODOSTextGaolField(),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "    목표 일수",
                    style: inputGoalAddHintTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  // SizedBox(
                  //   width: 50,
                  // ),
                  CupertinoButton(
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (_) => SizedBox(
                          width: double.infinity, // Width of the picker
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 30,
                            scrollController: FixedExtentScrollController(
                              initialItem: 2,
                            ),
                            children: const [
                              Text("5"),
                              Text("7"),
                              Text("10"),
                              Text("20"),
                              Text("30"),
                              Text("50"),
                              Text("100"),
                            ],
                            onSelectedItemChanged: (int value) {
                              setState(() {
                                _selectedDayValue = value;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.gray700,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dayList[_selectedDayValue],
                            style: TextStyle(color: Colors.black),
                          ),
                          Transform.scale(
                            scale:
                                1.5, // Increase the scale to make the icon taller
                            child: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                  // _IntegerExample(),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    "색상 ",
                    style: inputGoalAddHintTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  ODOSColorPalette(
                    onColorSelected: (index) {
                      setState(() {
                        selectedColorIndex = index;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "    이모지",
                    style: inputGoalAddHintTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  IconPicker()
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "생성",
                      style: inputGoalAddConfirmTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
