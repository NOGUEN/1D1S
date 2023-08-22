import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/controller/main/main_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/main_page/home_component/odos_circle_avatar.dart';
import 'package:one_day_one_something/app/view/main_page/home_component/odos_profile_card.dart';
import 'package:one_day_one_something/app/view/theme/app_colors.dart';
import 'package:one_day_one_something/app/view/theme/app_values.dart';

class HomePage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return BaseHomePage(
      widgetList: [
        SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 50,
            child: ODOSCircleAvatarList(
              itemCount: 10,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ODOSHomeProfileCard(),
      ],
    );
  }
}

class BaseHomePage extends StatelessWidget {
  final List<Widget> widgetList;
  const BaseHomePage({
    required this.widgetList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppValues.screenPadding),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgetList,
          ),
        ),
      ),
    );
  }
}
