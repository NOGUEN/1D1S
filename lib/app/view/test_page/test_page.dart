import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:one_day_one_something/app/controller/testpage/testpage_controller.dart';
import 'package:one_day_one_something/app/core/base/base_view.dart';

class TestPage extends BaseView<TestPageController> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    throw UnimplementedError();
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    throw UnimplementedError();
  }
}
