import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';

class ODOSCalander extends StatefulWidget {
  final int dateOffset; //이번 달의 시작 일이 무슨 요일인 지
  final int dateNum; //총 날짜 수
  const ODOSCalander({
    super.key,
    required this.dateOffset,
    required this.dateNum,
  });
  //const ODOSCalander({super.key});

  @override
  State<ODOSCalander> createState() => _ODOSCalanderState();
}

class _ODOSCalanderState extends State<ODOSCalander> {
  int month = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.defaultBackground,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: 20.0,
              spreadRadius: 0.5,
              offset: const Offset(0, 0),
            )
          ]),
      child: Column(
        children: [
          _titleBar(),
          Column(
              children: List.generate(6, (index) {
            return _buildDateRow(
                dateList: List.generate(
                    7, (subIndex) => _getRealDate(index * 7 + subIndex + 1)));
          })),
        ],
      ),
    );
  }

  int _getRealDate(int date) {
    int tempDate = date - widget.dateOffset;
    return (tempDate > widget.dateNum || tempDate <= 0 ? 0 : tempDate);
  }

  Widget _titleBar() {
    return Container(
        width: 300,
        height: 20,
        margin: EdgeInsets.fromLTRB(0, 12.h, 0, 4.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.keyboard_arrow_left),
                onPressed: () {
                  setState(() {
                    month -= 1;
                  });
                }),
            Text(
              month.toString(),
              style: head3,
            ),
            IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  setState(() {
                    month += 1;
                  });
                }),
          ],
        ));
  }

  Widget _buildDateRow({required List<int> dateList}) {
    return Container(
      width: 300,
      height: 20,
      margin: EdgeInsets.fromLTRB(0, 12.h, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            7, (int index) => _dateBox(dateList.elementAt(index))),
      ),
    );
  }

  Widget _dateBox(int date) {
    if (date == 0) {
      return SizedBox(
        width: 20.w,
        height: 20.w,
      );
    }
    return SizedBox(
        width: 20,
        height: 20,
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 20,
                height: 6,
                decoration: BoxDecoration(
                    color: AppColors.orangeBackground,
                    borderRadius: BorderRadius.circular(3)),
              ),
              Container(
                width: 20,
                height: 6,
                decoration: BoxDecoration(
                    color: AppColors.blueBackground,
                    borderRadius: BorderRadius.circular(3)),
              ),
              Container(
                width: 20,
                height: 6,
                decoration: BoxDecoration(
                    color: AppColors.greenBackground,
                    borderRadius: BorderRadius.circular(3)),
              ),
            ],
          ),
          SizedBox(
              width: 20,
              height: 20,
              child: Text(
                '$date',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
        ]));
  }
}
