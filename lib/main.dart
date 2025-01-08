import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'package:samduapp/ui/widgets/app_screen/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const myApp = MyApp();

  runApp(myApp);

  if (Platform.isWindows) {
    doWhenWindowReady(() {
      const initialSize = Size(600, 1000);
      const minSize = Size(600, 800);

      appWindow.minSize = minSize;
      appWindow.size = initialSize; //default size
      appWindow.show();
    });
  }
}
