import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_text_theme.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

class ODOSCalander extends StatelessWidget {
  const ODOSCalander({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361, height: 250, color: AppColors.gray200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Text('<'),Text(''),Text(''),Text('Month'),Text(''),Text(''),Text('>'),],),
          _buildDateRow([0, 0, 0, 0, 0, 0, 1]),
          _buildDateRow([2, 3, 4, 5, 6, 7, 8]),
          _buildDateRow([9, 10, 11, 12, 13, 14, 15]),
          _buildDateRow([16, 17, 18, 19, 20, 21, 22]),
          _buildDateRow([23, 24, 25, 26, 27, 28, 29]),
          _buildDateRow([30, 31, 0, 0, 0, 0, 0]),
        ],
      ),
    );
  }

  Widget _buildDateRow(List<int> dateList) {
    return SizedBox(
      width: 300, height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (int index) => date(dateList.elementAt(index))
        ),
      ),
    );
  }

  Widget date(int date) {
    return SizedBox(
        width: 20, height: 20,
        child: Text('$date', textAlign: TextAlign.end,)
    );
  }
}
