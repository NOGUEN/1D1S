import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';

import '../../theme/app_string.dart';
import '../../theme/app_values.dart';

class ODOSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ODOSAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0.0,
        title: const Text(
          AppString.str_1D1S,
          style: TextStyle(
            fontSize: 24,
            fontWeight: AppFontWeights.heavy,
            color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: AppColors.gray300,
            height: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppString.setting,
              height: AppValues.iconDefaultSize,
              width: AppValues.iconDefaultSize,
            ),
            iconSize: 50,
            onPressed: () {
              Get.toNamed(Routes.SETTING);
            },
          ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
