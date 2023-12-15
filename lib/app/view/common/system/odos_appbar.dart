import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/data/model/enum/menu_code.dart';
import 'package:one_day_one_something/app/routes/app_pages.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';

import '../../theme/app_string.dart';
import '../../theme/app_values.dart';

class ODOSAppBar extends StatelessWidget implements PreferredSizeWidget {
  ODOSAppBar({
    required this.mainController,
    required this.scrollController,
    super.key,
  });

  MainController mainController;
  ScrollController scrollController;
  Rx<double> scrollPosition = 0.0.obs;
  Rx<double> appBarHeight = 185.h.obs;

  @override
  Widget build(BuildContext context) {
    Widget replaceWidget = homeAppBar();
    scrollController.addListener(_scrollListener);

    return Obx(
      () {
        if (mainController.selectedMenuCode == MenuCode.HOME) {
          appBarHeight.value = 185.h + MediaQuery.of(context).padding.top;
          replaceWidget = homeAppBar();

          if (scrollPosition.value > 0) {
            if (appBarHeight != 105.h + MediaQuery.of(context).padding.top) {
              appBarHeight.value = 105.h + MediaQuery.of(context).padding.top;
            }
          } else {
            if (appBarHeight != 185.h + MediaQuery.of(context).padding.top) {
              appBarHeight.value = 185.h + MediaQuery.of(context).padding.top;
            }
          }
        } else if (mainController.selectedMenuCode == MenuCode.SOCIAL) {
          appBarHeight.value = 130.h + MediaQuery.of(context).padding.top;
          replaceWidget = socialAppBar();
        } else if (mainController.selectedMenuCode == MenuCode.MORE) {
          appBarHeight.value = 50.h + MediaQuery.of(context).padding.top;
          replaceWidget = moreAppBar();
        }
        return Container(
          height: appBarHeight.value,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 25.r,
                offset: const Offset(0, 0),
              ),
            ],
            color: Colors.red,
          ),
          child: replaceWidget,
        );
      },
    );
  }

  Widget homeAppBar() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: _AppBarTitleContent()),
          SizedBox(height: 5.h),
          _HomeAppBarContent(),
          if (scrollPosition.value <= 0) SizedBox(height: 5.h),
          if (scrollPosition.value <= 0) Divider(thickness: 2.h),
          if (scrollPosition.value <= 0) _UserInfo(),
        ],
      ),
    );
  }

  Widget socialAppBar() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: _AppBarTitleContent()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ODOSSearchTextField(
              controller: TextEditingController(),
              titleText: '',
              hintText: '검색',
            ),
          ),
          SizedBox(height: 15.h),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                GestureDetector(
                  child: Text(
                    '모두의 스트릭',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                ),
                Spacer(),
                VerticalDivider(
                  thickness: 2.w,
                  color: AppColors.black,
                ),
                Spacer(),
                GestureDetector(
                  child: Text(
                    '친구의 스트릭',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget moreAppBar() {
    return SizedBox(
      child: Column(
        children: [
          SafeArea(child: _AppBarTitleContent()),
        ],
      ),
    );
  }

  _scrollListener() {
    scrollPosition.value = scrollController.offset;
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight.value);
}

class _AppBarTitleContent extends StatelessWidget {
  const _AppBarTitleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              '홈',
              style: TextStyle(
                fontSize: 24,
                fontWeight: AppFontWeights.heavy,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
          )
        ],
      ),
    );
  }
}

class _HomeAppBarContent extends StatelessWidget {
  const _HomeAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: GestureDetector(
              child: FittedBox(
                child: CircleAvatar(
                  radius: 50.h,
                ),
              ),
              onTap: () {},
            ),
          );
        }),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 10.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.h,
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: Text(
                  '고라니 님',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onTap: () {},
              ),
              Text('자기소개'),
            ],
          ),
        ],
      ),
    );
  }
}
