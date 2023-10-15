import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

import '../../theme/app_text_theme.dart';

class ODOSSystemList extends StatelessWidget {
  const ODOSSystemList({
    super.key,
    required this.list,
    required this.categoryString,
  });
  final List<ODOSSystemListCell> list;
  final String categoryString;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryString,
          style: inputContentTextStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              odosShadow,
            ],
            color: AppColors.white,
          ),
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: list.length * 2,
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0) {
                return list[index ~/ 2];
              } else {
                if (index == list.length * 2 - 1) {
                  return null;
                }
                return const Divider(
                  color: AppColors.gray500,
                  indent: AppValues.iconDefaultSize + 40,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class ODOSSystemListCell extends StatelessWidget {
  const ODOSSystemListCell({super.key, required this.menuString, required this.onPressed, this.isConfirm = false,});
  final String menuString;
  final VoidCallback onPressed;
  final bool isConfirm;
  final EdgeInsets listPadding = const EdgeInsets.fromLTRB(20, 10, 0, 5);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (isConfirm) {
          final bool? result = await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('확인'),
                content: Text("정말로 탈퇴하시겠습니까?"),
                actions: [
                  TextButton(
                    child: Text("예"),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }
                  ),
                  TextButton(
                    child: Text("아니오"),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    }
                  )
                ]
              );
            }
          );
          if(result == true){
            onPressed();
          }
        }
        else{
          onPressed();
        }
      },
      child: SizedBox(
        child: Row(
          children: [
            Padding(
              padding: listPadding,
              child: const Icon(Icons.abc),
            ),
            Padding(
              padding: listPadding,
              child: Text(
                menuString,
                style: inputContentTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
