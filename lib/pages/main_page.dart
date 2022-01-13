import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:sejun_portf/controllers/main_page_controller.dart';
import 'package:sejun_portf/pages/card_1_page.dart';
import 'package:sejun_portf/widgets/sejun_banner_card.dart';
import 'package:sejun_portf/widgets/sejun_introduction_card.dart';
import 'package:sejun_portf/widgets/sejun_proejct_card.dart';
import 'package:url_launcher/url_launcher.dart';

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
      floatingActionButton: FutureBuilder(
        future: buildFloatingActionButton(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data as Container;
          } else {
            return Container();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            buildChips(context),
            buildContent(context),
          ],
        ),
      ),
    );
  }

  Future<Container> buildFloatingActionButton() async {
    return Container(
      width: 160,
      height: 60,
      decoration: ShapeDecoration(
          shape: const StadiumBorder(), color: Colors.grey.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () async {
              if (await canLaunch('https://https://github.com/sejun2')) {
                await launch('https://github.com/sejun2');
              }
            },
            child: Image.asset(
              'assets/image/github_64px.png',
              width: 45,
              height: 45,
            ),
          ),
          Tooltip(
            message: 'qpfjf56@gmail.com',
            padding: EdgeInsets.all(12),
            textStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            child: InkWell(
              onTap: () async {
                print('gmail clicked...');
                if (await canLaunch(
                    Uri(scheme: 'Sejun', path: 'qpfjf56@gmail.com')
                        .toString())) {
                  await launch(Uri(scheme: 'Sejun', path: 'qpfjf56@gmail.com')
                      .toString());
                }
              },
              child: Image.asset(
                'assets/image/gmail.png',
                width: 45,
                height: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildChips(BuildContext context) {
    return Wrap(
      children: const [
/*
        SejunChip(text: '# 세준'),
        SejunChip(text: '# 열심'),
        SejunChip(text: '# 집중'),
        SejunChip(text: '# 미래'),
        SejunChip(text: '# 노력'),
        SejunChip(text: '# 겸손'),
        SejunChip(text: '# 화이팅'),
        SejunChip(text: '# 할수있다!')
*/
      ],
    );
  }

  buildContent(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(children: [
          Container(
            width: constraints.maxWidth,
            child: SingleChildScrollView(
              controller: controller.getContentScrollViewController(),
              padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: SejunBannerCard()),
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            child: Text(
                              '저는 이런사람이에요.',
                              style: GoogleFonts.nanumGothic(
                                  fontSize: 40,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 450,
                            height: 40,
                            decoration: ShapeDecoration(
                                shape: StadiumBorder(),
                                color: Colors.grey.withOpacity(0.1)),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return Obx(
                                () => Stack(children: [
                                  AnimatedContainer(
                                    curve: Curves.fastOutSlowIn,
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: constraints.maxWidth / 3,
                                    decoration: ShapeDecoration(
                                        shape: StadiumBorder(),
                                        color: Colors.indigoAccent),
                                    duration: Duration(milliseconds: 300),
                                    transform: Matrix4.translationValues(
                                        (controller.getIntroductionIndex()) *
                                            constraints.maxWidth /
                                            3,
                                        0,
                                        0),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          controller.setIntroductionIndex(0);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          child: Text(
                                            'Patience',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: controller
                                                            .getIntroductionIndex() ==
                                                        0
                                                    ? Colors.white
                                                    : Colors.indigoAccent),
                                          ),
                                          decoration: ShapeDecoration(
                                              shape: StadiumBorder(),
                                              color: Colors.transparent),
                                        ),
                                      )),
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          controller.setIntroductionIndex(1);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          child: Text(
                                            'Effort',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: controller
                                                            .getIntroductionIndex() ==
                                                        1
                                                    ? Colors.white
                                                    : Colors.indigoAccent),
                                          ),
                                          decoration: ShapeDecoration(
                                              shape: StadiumBorder(),
                                              color: Colors.transparent),
                                        ),
                                      )),
                                      Expanded(
                                          child: InkWell(
                                        onTap: () {
                                          controller.setIntroductionIndex(2);
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          child: Text(
                                            'Open Minded',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: controller
                                                            .getIntroductionIndex() ==
                                                        2
                                                    ? Colors.white
                                                    : Colors.indigoAccent),
                                          ),
                                          decoration: ShapeDecoration(
                                              shape: StadiumBorder(),
                                              color: Colors.transparent),
                                        ),
                                      )),
                                    ],
                                  ),
                                ]),
                              );
                            }),
                          ),
                          Obx(
                            () => ProsteIndexedStack(
                              index: controller.getIntroductionIndex(),
                              children: [
                                IndexedStackChild(
                                    child: SejunIntroductionCard(
                                  title: 'Patience',
                                  content: '어려운 문제상황에서도\n포기하지않고 끝까지 해냅니다 ',
                                )),
                                IndexedStackChild(
                                    child: SejunIntroductionCard(
                                  title: 'Effort',
                                  content: '어제보다 더 나은 개발자가\n되기위해 꾸준히 노력합니다',
                                )),
                                IndexedStackChild(
                                    child: SejunIntroductionCard(
                                  title: 'Open minded',
                                  content:
                                      '늘 열린 마음으로 좋은것들을 받아들이고\n따끔한 충고나 조언에 감사합니다',
                                )),
                              ],
                            ),
                          ),
                        ]),
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
                          '저의 프로젝트를 소개합니다',
                          style: GoogleFonts.nanumGothic(
                              fontSize: 40,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: constraints.maxWidth,
                          height: 600,
                          child: ListView(
                            itemExtent: 450,
                            padding: EdgeInsets.only(left: 40, right: 40),
                            scrollDirection: Axis.horizontal,
                            children: [
                              SejunProjectCard(
                                onSejunProjectCardTapped: () {
                                  Get.to(() => Card1Page());
                                },
                                title: '당신의 쉐푸',
                              ),
                              SejunProjectCard(
                                onSejunProjectCardTapped: () {
                                  Get.to(() => Card1Page());
                                },
                                title: 'Flutter 외주 프로젝트',
                              ),
                              SejunProjectCard(
                                  onSejunProjectCardTapped: () {
                                    Get.to(() => Card1Page());
                                  },
                                  title: 'Tflite 프로젝트'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildGradientDivider(context),
        ]);
      }),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: _appBarHeight,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Obx(
          () =>  AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          opacity: controller.getAppBarOpacity(),
          child: Text('Sejun\'s portfolio',
              style: GoogleFonts.caveat(
                  letterSpacing: 10,
                  fontSize: 30,
                  color: Colors.black.withOpacity(0.7))),
        ),
      ),
    );
  }

  buildGradientDivider(BuildContext context) {
    return Obx(
      () => controller.getIsContentScrollViewTop() == false
          ? Container(
              width: Get.width,
              height: 6,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.grey.withOpacity(0.5),
                Colors.grey.withOpacity(0.0)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            )
          : const SizedBox(
              height: 2,
            ),
    );
  }
}
