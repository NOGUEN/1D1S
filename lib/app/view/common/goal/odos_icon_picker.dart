import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';

class IconPicker extends StatefulWidget {
  @override
  _IconPickerState createState() => _IconPickerState();
}

class _IconPickerState extends State<IconPicker> {
  final List<String> icons = [
    'images/icon_add.png',
    'images/icon_blue_book.png',
    'images/icon_fire.png',
  ];

  int selectedIconIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => SizedBox(
            height: 250,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of images in a row
              ),
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIconIndex = index;
                    });
                    Navigator.of(context).pop();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      icons[index],
                      width: 20,
                      height: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      pressedOpacity: 0.8,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15), // Make the container rounded
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              blurRadius: 4, // Shadow blur radius
              offset: Offset(0, 2), // Shadow offset
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            icons[selectedIconIndex],
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
