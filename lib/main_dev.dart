import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_day_one_something/firebase_options.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'app/main.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "1D1S",
    baseUrl: "",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const App());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
