import 'package:one_day_one_something/app/view/common/goal/odos_fast_record_dropdown.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';
import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:one_day_one_something/app/controller/service/record_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/base/base_view.dart';

class recordDialogBox extends StatefulWidget {
  final String my_goal;
  final String doc_id;

  const recordDialogBox(
      {super.key, required this.my_goal, required this.doc_id});

// class recordDialogBox extends StatefulWidget {
//   final String selectedGoalId;
//   final List goalList;
//   const recordDialogBox({
//     super.key,
//     required this.selectedGoalId,
//     required this.goalList
//   });
// >>>>>>> main

  @override
  State<recordDialogBox> createState() => _recordDialogBoxState();
}

class _recordDialogBoxState extends State<recordDialogBox> {
  RecordController recordController = RecordController();
  Future<bool> todaydatepossible() {
    return recordController.todaydatepossible(widget.doc_id, date);
  }

  void saveDataToFirestore() {
    recordController.saveDataToFirestore(widget.doc_id, date);
  }

  void increasestreak() {
    recordController.increaseStreak(widget.doc_id);
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
// class _recordDialogBoxState extends State<recordDialogBox>{

//   //추가 버튼 click시 firebase에 전달할 state들
//   Rx<String> selectedGoalId="".obs;
//   Rx<DateTime> date = DateTime.now().obs;
//   final recordContentEditingController = TextEditingController();

//   @override
//   void initState(){
//     super.initState();
//     selectedGoalId=widget.selectedGoalId.obs;
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      insetPadding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: BaseRecordDialogBox(
          widgetList: <Widget>[
            SizedBox(height: 19.h,),
            dialogTitle(),
            SizedBox(height: 9.h,),
            Obx(() => ODOSSelectGoalDropdown(
              goalList: widget.goalList,
              selectedGoalId: selectedGoalId.value,
              setSelectedGoalValue: (String? value)=>{
                selectedGoalId.value=value!
              },
            )),
            SizedBox(height: 17.h,),
            DateSelectButton(context),
            SizedBox(height: 11.h),
            contentText(),
            SizedBox(height: 9.h,),
            contentTextField(),
            SizedBox(height: 12.h),
            addButton(context),
            SizedBox(height: 19.h,)
          ]
      )
    );
  }

  Widget dialogTitle(){
    return Text(
      "새 기록",
      style: goalNewcardDialog,
    );
  }

  Widget DateSelectButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "날짜",
          style: inputGoalAddHintTextStyle,
          textAlign: TextAlign.start,
        ),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                          if (true) {
                            setState(() {
                              date = selectedDate!;
                            });
                          }
                          recordController.record_date.value =
                              selectedDate.toString();
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
                    onChanged: (value) {
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
//           onPressed: () async {
//             final selectedDate = await showDatePicker(
//               context: context,
//               initialDate: date.value,
//               firstDate: DateTime(2000),
//               lastDate: DateTime.now(),
//             );
//             if (selectedDate != null) {
//               date.value = selectedDate;
//             }
//           },
//           child: Row(
//             children: [
//               Obx(
//                 () {
//                   return Text(
//                     " ${date.value.year}.${date.value.month
//                         .toString()
//                         .padLeft(2, '0')}.${date.value.day
//                         .toString()
//                         .padLeft(2, '0')}",
//                     style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: AppFontWeights.bold,
                    ),
                    child: TextButton(
                      onPressed: () async {
                        if (await todaydatepossible()) {
                          saveDataToFirestore();
                          increasestreak();
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "기록",
                        style: RecordAddConfirmTextStyle,
                      ),
                    ),
                  ),
                ),
//                   );
//                 }
//               ),
//               Icon(
//                 Icons.arrow_drop_down,
//                 color: Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contentText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "내용",
          style: inputGoalAddHintTextStyle,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }

  Widget contentTextField(){
    return Container(
      width: 250.w,
      height: 120.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: recordContentEditingController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
              top: 12.h, left: 13.w
          ),
          hintText: "오늘 한 일을 기록해봐요.",
          hintStyle: RecordAddInputContentHintTextStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget addButton(BuildContext context){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 120.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {
            //TODO: firebase에 기록 추가 기능
            print(recordContentEditingController.text);
            print(date);
            print(selectedGoalId);

            Navigator.of(context).pop();
            // Get.back();
          },
          child: Text(
            "추가",
            style: RecordAddConfirmTextStyle,
          ),
        ),
      ),
    );
  }
}

class BaseRecordDialogBox extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseRecordDialogBox({
    super.key,
    required this.widgetList
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 300.w,
        height: 400.h,
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              offset: Offset(0, 0),
              spreadRadius: 0.5,
              blurRadius: 15,
            ),
          ],
        ),
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widgetList,
          ),
        )
    );
  }
}