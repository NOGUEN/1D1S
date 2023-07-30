import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';

class ODOSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ODOSAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 0.0,
      title: const Text(
        "1D1S",
        style: TextStyle(
          fontSize: 24,
          fontWeight: AppFontWeights.heavy,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
