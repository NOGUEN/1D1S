import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:get/get.dart';

class ODOSColorPalette extends StatefulWidget {
  final void Function(int) onColorSelected; // 선택한 색상의 인덱스를 전달하는 콜백 추가

  ODOSColorPalette({required this.onColorSelected});
  @override
  State<StatefulWidget> createState() => _ODOSColorPaletteState();
}

class _ODOSColorPaletteState extends State<ODOSColorPalette> {
  static final List<Color> circleColors = [
    AppColors.defaultBackground,
    AppColors.redBackground,
    AppColors.orangeBackground,
    AppColors.yellowBackground,
    AppColors.greenBackground,
    AppColors.blueBackground,
    AppColors.purpleBackground,
  ];

  int selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (index) => _buildDayWidget(index)),
    );
  }

  Widget _buildDayWidget(int dayIndex) {
    bool isSelected = dayIndex == selectedColorIndex;
    Color borderColor = isSelected ? Colors.black : Colors.white;
    List<BoxShadow> shadow = isSelected
        ? []
        : [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColorIndex = dayIndex;
          widget.onColorSelected(dayIndex); // 선택한 색상의 인덱스를 콜백으로 전달
        });
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0), // Adjust the spacing as needed
            child: Container(
              width: 28.04,
              height: 28.74,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: 2,
                ),
                boxShadow: shadow,
                color: circleColors[dayIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
