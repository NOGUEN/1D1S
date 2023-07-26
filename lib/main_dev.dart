import 'package:flutter/material.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'app/main.dart';

void main() {
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
}
