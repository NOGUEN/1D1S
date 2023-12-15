// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/controller/testpage/testpage_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';

class TestPage extends BaseView<TestPageController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    throw UnimplementedError();
  }
}
