import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejun_portf/controllers/main_page_controller.dart';

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
      ),
      home: const MainPage(),
      defaultTransition: Transition.downToUp,
      scrollBehavior: SejunScrollBehavior(),
      initialBinding: BindingsBuilder.put(() => MainPageController()),
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
