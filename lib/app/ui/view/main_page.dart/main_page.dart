import 'package:one_day_one_something/app/ui/responsive.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/app/ui/view/main_page.dart/component/header.dart';

import '../../theme/constants.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: Header(),
              ),
            Expanded(
              flex: 5,
              child: Header(),
            ),
          ],
        ),
      ),
    );
  }
}
