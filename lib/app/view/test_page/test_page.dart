import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/controller/testpage/testpage_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';
import 'package:one_day_one_something/app/view/common/system/odos_appbar.dart';

class TestPage extends BaseView<TestPageController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    //return const ODOSAppBar();
  }

  @override
  Widget body(BuildContext context) {
    throw UnimplementedError();
  }
}
