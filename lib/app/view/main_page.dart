import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';

import '../controller/main/main_controller.dart';

class MainPage extends BaseView<MainController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text("hello"),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
