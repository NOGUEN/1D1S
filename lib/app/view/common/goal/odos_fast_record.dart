import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field_goalver.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_color_palette.dart';
import 'package:one_day_one_something/app/view/common/goal/odos_icon_picker.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_day_one_something/app/controller/service/record_service.dart';

class recordDialogBox extends StatefulWidget {
  final String my_goal;
  final String doc_id;

  const recordDialogBox({super.key, required this.my_goal, required this.doc_id});

  @override
  State<StatefulWidget> createState() => _recordDialogBoxState();
}


class _recordDialogBoxState extends State<recordDialogBox> {
  RecordController recordController = RecordController();
  void saveDataToFirestore() {
    recordController.saveDataToFirestore(widget.doc_id, date);
  }
  int selectedColorIndex = 0; // 선택한 색상의 인덱스를 로컬 변수로 추가
  int _selectedDayValue = 2;
  DateTime selectedDate = DateTime.now();
  DateTime date = DateTime.now();
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2023),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
            color: Colors.white, // 동적으로 변경된 색상을 반영
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
                widget.my_goal, // Use my_goal parameter here
                style: goalNewcardDialog,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "    날짜",
                    style: inputGoalAddHintTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              date = selectedDate;
                            });
                          }
                          recordController.record_date.value = selectedDate.toString();
                        },
                        child: Container(
                          // padding: EdgeInsets.only(bottom: 8.0),  // 텍스트와 밑줄 사이의 간격을 조정합니다.
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black, // 원하는 밑줄 색상을 선택하세요.
                                width: 2.0, // 밑줄의 두께를 조정하세요.
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                " ${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: AppFontWeights.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "    세부 기록",
                    style: inputGoalAddHintTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  // Adjust margin as needed
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 8), // Adjust vertical padding
                      hintText: "기록을 입력해주세요",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                    onChanged: (value){
                      recordController.record_note.value = value.toString();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 160,
                  height: 35,
                  child: Container(
                    margin: EdgeInsets.zero, // margin을 0으로 설정합니다.
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        saveDataToFirestore();
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "기록",
                        style: RecordAddConfirmTextStyle,
                      ),
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
