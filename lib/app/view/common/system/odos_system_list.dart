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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryString,
            style: inputContentTextStyle,
          ),
          const SizedBox(
            height: 20,
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
      ),
    );
  }
}

class ODOSSystemListCell extends StatelessWidget {
  const ODOSSystemListCell({super.key, required this.menuString});
  final String menuString;
  final EdgeInsets listPadding = const EdgeInsets.fromLTRB(20, 10, 0, 5);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
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
        )
      ]),
    );
  }
}
