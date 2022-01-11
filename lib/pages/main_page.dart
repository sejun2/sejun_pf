import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sejun_portf/constant.dart';
import 'package:sejun_portf/controllers/main_page_controller.dart';
import 'package:sejun_portf/widgets/sejun_card.dart';
import 'package:sejun_portf/widgets/sejun_chip.dart';
import 'package:sejun_portf/widgets/sejun_introduction_card.dart';
import 'package:sejun_portf/widgets/sejun_proejct_card.dart';

class MainPage extends GetView<MainPageController> {
  MainPage({Key? key}) : super(key: key);

  static const double _appBarHeight = 66.0;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  StatelessElement createElement() {
    Get.lazyPut(() => MainPageController());
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            buildChips(context),
            buildGradientDivider(context),
            buildContent(context),
          ],
        ),
      ),
    );
  }

  buildChips(BuildContext context) {
    return Wrap(
      children: const [
        SejunChip(text: '# 세준'),
        SejunChip(text: '# 열심'),
        SejunChip(text: '# 집중'),
        SejunChip(text: '# 미래'),
        SejunChip(text: '# 노력'),
        SejunChip(text: '# 겸손'),
        SejunChip(text: '# 화이팅'),
        SejunChip(text: '# 할수있다!')
      ],
    );
  }

  buildContent(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          child: SingleChildScrollView(
            controller: controller.getContentScrollViewController(),
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(44),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  width: constraints.maxWidth,
                  height: 800,
                  child: SejunIntroductionCard(),
                ),

                const SizedBox(
                  height: 150,
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(44),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  width: constraints.maxWidth,
                  height: 800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '프로젝트',
                        style: GoogleFonts.sunflower(
                            fontSize: 66,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: constraints.maxWidth,
                        height: 600,
                        child: ListView(
                          itemExtent: 600,
                          padding: EdgeInsets.only(left: 40, right: 40),
                          scrollDirection: Axis.horizontal,
                          children: [
                            SejunProjectCard(
                              title: '당신의 쉐푸',
                            ),
                            SejunProjectCard(
                              title: 'Flutter 외주 프로젝트',
                            ),
                            SejunProjectCard(title: 'Tflite 프로젝트'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: _appBarHeight,
      backgroundColor: Colors.white,
      elevation: 4,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network(
              'https://dummyimage.com/1200x400/000/fff',
              width: 16,
              height: 16,
              fit: BoxFit.contain,
            ),
          ).marginOnly(right: 12),
          Text(
            'Sejun',
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
      shape: const StadiumBorder(),
      actions: [],
    );
  }

  buildGradientDivider(BuildContext context) {
    return Obx(
      () => controller.getIsContentScrollViewTop() == false
          ? Container(
              width: Get.width,
              height: 2,
              color: Colors.black.withOpacity(0.1),
            )
          : const SizedBox(
              height: 2,
            ),
    );
  }
}
