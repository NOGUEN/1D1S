// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/data/model/enum/menu_code.dart';
import 'package:one_day_one_something/app/view/common/system/odos_text_field.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_fontweight.dart';

class ODOSAppBar extends StatelessWidget implements PreferredSizeWidget {
  ODOSAppBar({
    required this.mainController,
    required this.scrollController,
    super.key,
  });

  MainController mainController;
  ScrollController scrollController;
  Rx<double> scrollPosition = 0.0.obs;
  double appBarHeight = 183.h;

  @override
  Widget build(BuildContext context) {
    Widget replaceWidget = homeAppBar();
    scrollController.addListener(_scrollListener);

    return Obx(
      () {
        if (mainController.selectedMenuCode == MenuCode.HOME) {
          replaceWidget = homeAppBar();
          if (scrollPosition.value > 0) {
            appBarHeight = 105.h + MediaQuery.of(context).padding.top;
          } else {
            appBarHeight = 185.h + MediaQuery.of(context).padding.top;
          }
        } else if (mainController.selectedMenuCode == MenuCode.SOCIAL) {
          replaceWidget = socialAppBar();
          appBarHeight = 130.h + MediaQuery.of(context).padding.top;
        } else if (mainController.selectedMenuCode == MenuCode.MORE) {
          replaceWidget = moreAppBar();
          appBarHeight = 60.h + MediaQuery.of(context).padding.top;
        }
        return Container(
          height: appBarHeight,
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
            color: Colors.white,
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
          const SafeArea(child: _AppBarTitleContent()),
          SizedBox(height: 5.h),
          const _HomeAppBarContent(),
          if (scrollPosition.value <= 0) SizedBox(height: 5.h),
          if (scrollPosition.value <= 0) Divider(thickness: 2.h),
          if (scrollPosition.value <= 0) const _UserInfo(),
        ],
      ),
    );
  }

  Widget socialAppBar() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(child: _AppBarTitleContent()),
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
                const Spacer(),
                GestureDetector(
                  child: Text(
                    '모두의 스트릭',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                ),
                const Spacer(),
                VerticalDivider(
                  thickness: 2.w,
                  color: AppColors.black,
                ),
                const Spacer(),
                GestureDetector(
                  child: Text(
                    '친구의 스트릭',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: AppFontWeights.bold,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget moreAppBar() {
    return const SizedBox(
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
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class _AppBarTitleContent extends StatelessWidget {
  const _AppBarTitleContent();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const Text(
              '홈',
              style: TextStyle(
                fontSize: 24,
                fontWeight: AppFontWeights.heavy,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          )
        ],
      ),
    );
  }
}

class _HomeAppBarContent extends StatelessWidget {
  const _HomeAppBarContent();

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
  const _UserInfo();

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
                child: const Text(
                  '고라니 님',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onTap: () {},
              ),
              const Text('자기소개'),
            ],
          ),
        ],
      ),
    );
  }
}
