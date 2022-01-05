import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sejun',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      scrollBehavior: SejunScrollBehavior()
    );
  }
}

class SejunScrollBehavior extends MaterialScrollBehavior {

  @override
  Set<PointerDeviceKind> get dragDevices =>
      {
        PointerDeviceKind.mouse, PointerDeviceKind.touch
      };
}
