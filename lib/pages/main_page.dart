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

import '../constant.dart';

class MainPage extends GetView<MainPageController> {
  MainPage({Key? key}) : super(key: key);

  static const double _appBarHeight = 66.0;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  StatelessElement createElement() {
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MainPageController());
    return Scaffold(
      drawer: Container(width: 400,
        decoration: BoxDecoration(
             color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(24), bottomRight: Radius.circular(24)),
          ),
        child: ListView(
          children: [
            buildDrawerHeader(),

          ],
        ),
      ),
      appBar: buildAppBar(context),
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
            // buildChips(context),
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
              await launchUrl('https://github.com/sejun2');
            },
            child: Image.asset(
              'image/github_64px.png',
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
              onTap: () async {},
              child: Image.asset(
                'image/gmail.png',
                width: 45,
                height: 45,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
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
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                children: [
                  buildBannerCard(),

                  ///Introduction section
                  Container(
                    decoration: BoxDecoration(
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

                          ///Introduction title
                          Align(
                            child: Text(
                              '소개 >',
                              style: GoogleFonts.nanumGothic(
                                  fontSize: 30,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          const VerticalDivider(
                            indent: 20,
                            endIndent: 20,
                          ),

                          ///Introduction Tab item background
                          Container(
                            width: 450,
                            height: 40,
                            decoration: ShapeDecoration(
                                shape: const StadiumBorder(),
                                color: Colors.grey.withOpacity(0.1)),
                            child:
                            LayoutBuilder(builder: (context, constraints) {
                              return Obx(
                                    () =>
                                    Stack(children: [

                                      ///Introduction Tab item background animation container
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
                                            (controller
                                                .getIntroductionIndex()) *
                                                constraints.maxWidth /
                                                3,
                                            0,
                                            0),
                                      ),

                                      ///Introduction Tab item
                                      Row(
                                        children: [
                                          Expanded(
                                              child: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .setIntroductionIndex(
                                                        0);
                                                    controller
                                                        .cardAnimationController
                                                        .forward(from: 0);
                                                  },
                                                  child: buildIntroductionTabItem(
                                                      'Patience', 0))),
                                          Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  controller
                                                      .setIntroductionIndex(1);
                                                  controller
                                                      .cardAnimationController
                                                      .forward(from: 0);
                                                },
                                                child: buildIntroductionTabItem(
                                                    "Effort", 1),
                                              )),
                                          Expanded(
                                              child: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .setIntroductionIndex(
                                                        2);
                                                    controller
                                                        .cardAnimationController
                                                        .forward(from: 0);
                                                  },
                                                  child: buildIntroductionTabItem(
                                                      'Open minded', 2))),
                                        ],
                                      ),
                                    ]),
                              );
                            }),
                          ),

                          ///Introduction main contents
                          Obx(
                                () =>
                                ProsteIndexedStack(
                                  index: controller.getIntroductionIndex(),
                                  children: [
                                    IndexedStackChild(
                                        child: SejunIntroductionCard(
                                          imagePath: 'image/patience.jpg',
                                          title: 'Patience',
                                          content: '어려운 문제상황에서도\n포기하지않고 끝까지 해냅니다 ',
                                          animationController:
                                          controller.cardAnimationController,
                                          color: Colors.purple,
                                        )),
                                    IndexedStackChild(
                                        child: SejunIntroductionCard(
                                          imagePath: 'image/effort.jpg',
                                          title: 'Effort',
                                          content: '어제보다 더 나은 개발자가\n되기위해 꾸준히 노력합니다',
                                          animationController:
                                          controller.cardAnimationController,
                                          color: Colors.cyan,
                                        )),
                                    IndexedStackChild(
                                        child: SejunIntroductionCard(
                                          imagePath: 'image/openminded.jpg',
                                          animationController:
                                          controller.cardAnimationController,
                                          title: 'Open minded',
                                          content:
                                          '늘 열린 마음으로 좋은것들을 받아들이고\n따끔한 충고나 조언에 감사합니다',
                                          color: Colors.green[300],
                                        )),
                                  ],
                                ),
                          ),
                          VerticalDivider(
                            indent: 30,
                          )
                        ]),
                  ),
                  VerticalDivider(
                    indent: 150,
                  ),

                  ///Project section
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ///Project lists title
                        Padding(
                          child: Text(
                            '프로젝트 >',
                            style: GoogleFonts.nanumGothic(
                                fontSize: 30,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24),
                        ),

                        ///Project lists
                        SizedBox(
                          width: constraints.maxWidth,
                          height: 600,
                          child: ListView(
                            itemExtent: 450,
                            padding: EdgeInsets.only(left: 40, right: 40),
                            scrollDirection: Axis.horizontal,
                            children: [
                              SejunProjectCard(
                                onSejunProjectCardTapped: () async {
                                  launchUrl(
                                      'https://github.com/sejun2/sejun_pf/blob/develop/res/yourchef/yourchef.md');
                                },
                                title: '당신의 쉐푸 사이드 프로젝트 ',
                                imagePath: 'image/yourchef_logo.png',
                              ),
                              SejunProjectCard(
                                onSejunProjectCardTapped: () {
                                  Get.to(() => Card1Page());
                                },
                                title: 'Flutter 역사 교육 앱 프로젝트',
                                imagePath: 'image/fieldtrip.png',
                              ),
                              SejunProjectCard(
                                onSejunProjectCardTapped: () {
                                  Get.to(() => Card1Page());
                                },
                                title: 'Flutter 머신러닝 앱 프로젝트',
                                imagePath: 'image/hs_logo.jpeg',
                              ),
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

  Container buildIntroductionTabItem(String title, int index) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            color: controller.getIntroductionIndex() == index
                ? Colors.white
                : Colors.indigoAccent),
      ),
      decoration: ShapeDecoration(
          shape: const StadiumBorder(), color: Colors.transparent),
    );
  }

  Container buildBannerCard() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: const SejunBannerCard());
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: _appBarHeight,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black87),
      title: Obx(
            () =>
            AnimatedOpacity(
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
          () =>
      controller.getIsContentScrollViewTop() == false
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
        height: 6,
      ),
    );
  }

  buildDrawerHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [ Colors.grey.shade200, Colors.white], begin:Alignment.topCenter, end: Alignment.bottomCenter)
      ),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Material(
              shape: CircleBorder(
              ),
              elevation: 5,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100,
                backgroundImage: AssetImage('image/dummy_profile.jpeg'),
              ),
            ),
          ),
          VerticalDivider(
            indent: 24,
          ),
          Text('이름 : 임세준', style: headerTextStyle, softWrap: true,),
          VerticalDivider(
            indent: 8,
          ),
          Text('생년월일 : 1993.01.02', style: headerTextStyle,),
          VerticalDivider(
            indent: 16,
          ),
          Text('2016.03 ~ 2021.07 세종대학교 정보보호학과 학사', style: headerTextStyle,),
          VerticalDivider(indent: 8,),
          Text('2020.08 ~ 2021.01 (주)크립토', style: headerTextStyle,),
          VerticalDivider(indent: 8,),
          Text('2021.07 ~ 2022.01 힐링사운드', style: headerTextStyle,),
        ],
      ),
    );
  }
}
