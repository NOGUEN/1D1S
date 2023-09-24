import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_day_one_something/app/bindings/initial_binding.dart';
import 'package:one_day_one_something/flavors/build_config.dart';
import 'package:one_day_one_something/flavors/env_config.dart';
import 'routes/app_pages.dart';
import 'view/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: (buildContext, widget) => GetMaterialApp(
        title: _envConfig.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.pages,
        initialBinding: InitialBinding(),
        theme: appThemeData,
        defaultTransition: Transition.fade,
      ),
    );
  }
}
