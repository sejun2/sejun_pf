import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proste_indexed_stack/proste_indexed_stack.dart';
import 'package:sejun_portf/controllers/main_page_controller.dart';
import 'package:sejun_portf/widgets/sejun_banner_card.dart';
import 'package:sejun_portf/widgets/sejun_introduction_card.dart';
import 'package:sejun_portf/widgets/sejun_proejct_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({Key? key}) : super(key: key);

  static const double _appBarHeight = 66.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(width: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(24), bottomRight: Radius.circular(24)),
        ),
        child: ListView(
          children: [
            _buildDrawerHeader(),
          ],
        ),
      ),
      appBar: _buildAppBar(context),
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
              await _launchUrl('https://github.com/sejun2');
            },
            child: Image.asset(
              'image/github_64px.png',
              width: 45,
              height: 45,
            ),
          ),
          Tooltip(
            message: 'qpfjf56@gmail.com',
            padding: const EdgeInsets.all(12),
            textStyle: const TextStyle(
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

  /// Launch url if the url is available.
  /// If succeeded return true, else false.
  Future<bool> _launchUrl(String url) async {
    // Because recently canLaunch method always return false,  it is deleted until fix.
    // This issue is commented to canLaunchUrl
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(url);
    // }
    try {
      await launchUrl(Uri.parse(url));
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @Deprecated('It will be not used soon')
  buildChips(BuildContext context) {
    return Wrap(
      children: const [
      ],
    );
  }

  buildContent(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(children: [
          SizedBox(
            width: constraints.maxWidth,
            child: PageView(
              scrollDirection: Axis.vertical,
              children: [
                // TODO('Satoshi'): 약간이라도 성능 향상을 위해 widget 으로 분리시키는게 필요
                _buildBannerCard(),
                _buildIntroductionSection(constraints),
                _buildProjectSection(constraints),
              ],
            ),
          ),
          _buildGradientDivider(context),
        ]);
      }),
    );
  }

  Container _buildProjectSection(BoxConstraints constraints) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
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
            padding: const EdgeInsets.symmetric(horizontal: 24),
          ),

          ///Project lists
          SizedBox(
            width: constraints.maxWidth,
            height: 600,
            child: ListView(
              itemExtent: 450,
              padding: const EdgeInsets.only(left: 40, right: 40),
              scrollDirection: Axis.horizontal,
              children: [
                SejunProjectCard(
                  onSejunProjectCardTapped: () async {
                    _launchUrl(
                        '#');
                  },
                  title: '(주)크립토 이더리움 Dapp',
                  imagePath: 'image/yourchef_logo.png',
                ),
                SejunProjectCard(
                  onSejunProjectCardTapped: () async {
                    _launchUrl(
                        'https://github.com/sejun2/sejun_pf/blob/develop/res/yourchef/yourchef.md');
                  },
                  title: '당신의 쉐푸 사이드 프로젝트 ',
                  imagePath: 'image/yourchef_logo.png',
                ),
                SejunProjectCard(
                  onSejunProjectCardTapped: () {
                    _launchUrl(
                        'https://github.com/sejun2/fieldtrip_sejun/blob/develop/README.md');
                  },
                  title: 'Flutter 역사 교육 앱 프로젝트',
                  imagePath: 'image/fieldtrip.png',
                ),
                SejunProjectCard(
                  onSejunProjectCardTapped: () {
                    _launchUrl('https://github.com/sejun2/sejun_pf/blob/develop/res/healingsound/hs.md');
                  },
                  title: 'Flutter 머신러닝 앱 프로젝트',
                  imagePath: 'image/hs_logo.jpeg',
                ),
                SejunProjectCard(
                  onSejunProjectCardTapped: () {
                    _launchUrl('#');
                  },
                  title: 'ZeroXFlow 영어 교육 Application',
                  imagePath: 'image/1hour_logo_image.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildIntroductionSection(BoxConstraints constraints) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
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
            ///TODO('Satoshi'): widget 으로 분리하여 재사용성 높이기
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
                          decoration: const ShapeDecoration(
                              shape: StadiumBorder(),
                              color: Colors.indigoAccent),
                          duration: const Duration(milliseconds: 300),
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
                                    child: _buildIntroductionTabItem(
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
                                  child: _buildIntroductionTabItem(
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
                                    child: _buildIntroductionTabItem(
                                        'Open minded', 2))),
                          ],
                        ),
                      ]),
                );
              }),
            ),

            ///Introduction main contents
            Obx( () => _buildIntroductionMainContents(), ),
            const VerticalDivider(
              indent: 30,
            )
          ]),
    );
  }

  ProsteIndexedStack _buildIntroductionMainContents() {
    return ProsteIndexedStack(
      index: controller.getIntroductionIndex(),
      children: [
        IndexedStackChild(
            child: SejunIntroductionCard(
              imagePath: 'image/patience.jpg',
              title: 'Patience',
              content: '어려운 문제상황에서도\n포기하지않고 끝까지 해냅니다 ',
              animationController: controller.cardAnimationController,
              color: Colors.purple,
            )),
        IndexedStackChild(
            child: SejunIntroductionCard(
              imagePath: 'image/effort.jpg',
              title: 'Effort',
              content: '어제보다 더 나은 개발자가\n되기위해 꾸준히 노력합니다',
              animationController: controller.cardAnimationController,
              color: Colors.cyan,
            )),
        IndexedStackChild(
            child: SejunIntroductionCard(
              imagePath: 'image/openminded.jpg',
              animationController: controller.cardAnimationController,
              title: 'Open minded',
              content: '늘 열린 마음으로 좋은것들을 받아들이고\n따끔한 충고나 조언에 감사합니다',
              color: Colors.green[300],
            )),
      ],
    );
  }

  Container _buildIntroductionTabItem(String title, int index) {
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
      decoration: const ShapeDecoration(
          shape: StadiumBorder(), color: Colors.transparent),
    );
  }

  Container _buildBannerCard() {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: const SejunBannerCard());
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: _appBarHeight,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.black87),
      title: Obx(
            () =>
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
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

  Obx _buildGradientDivider(BuildContext context) {
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

  //TODO('Satoshi'): Header 좀 이쁘게 만들기
  Container _buildDrawerHeader() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [ Colors.grey.shade200, Colors.white], begin:Alignment.topCenter, end: Alignment.bottomCenter)
      ),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
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
          const VerticalDivider(
            indent: 24,
          ),
          Text('이름 : 임세준', style: headerTextStyle, softWrap: true,),
          const VerticalDivider(
            indent: 8,
          ),
          Text('생년월일 : 1993.01.02', style: headerTextStyle,),
          const VerticalDivider(
            indent: 16,
          ),
          Text('2016.03 ~ 2020.07 세종대학교 정보보호학과 학사', style: headerTextStyle,),
          const VerticalDivider(indent: 8,),
          Text('2020.08 ~ 2021.01 (주)크립토', style: headerTextStyle,),
          const VerticalDivider(indent: 8,),
          Text('2021.06 ~ 2022.01 힐링사운드', style: headerTextStyle,),
          const VerticalDivider(indent: 8,),
          Text('2022.04 ~ 2022.12 제로엑스플로우', style: headerTextStyle,),
        ],
      ),
    );
  }
}
