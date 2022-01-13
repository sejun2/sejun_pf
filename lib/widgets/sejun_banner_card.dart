import 'package:flutter/material.dart';

class SejunBannerCard extends StatefulWidget {
  const SejunBannerCard({Key? key}) : super(key: key);

  @override
  _SejunBannerCardState createState() => _SejunBannerCardState();
}

class _SejunBannerCardState extends State<SejunBannerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _colorFilterAnimationController;
  late Animation _colorFilterAnimation;

  initAnimationResources() {
    _colorFilterAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 2800));
    _colorFilterAnimation = ColorTween(begin: Colors.black12, end: Colors.white)
        .animate(CurvedAnimation(
      parent: _colorFilterAnimationController,
      curve: Curves.easeInOut,
    ));

    _colorFilterAnimation.addListener(() {
      print('Current color value :: ${_colorFilterAnimation.value}');
    });
  }

  @override
  void initState() {
    initAnimationResources();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    _colorFilterAnimationController.forward();

    return Align(
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (context, constraints) {
        double fixedColumnWidthValue = constraints.maxWidth > 1150 ? 160 : 110;
        double centerFixedColumnWidthValue =
            constraints.maxWidth > 1150 ? 340 : 240;
        double cardSize = constraints.maxWidth > 1150 ? 140 : 90;
        double centerCardSize = constraints.maxWidth > 1150 ? 340 : 200;
        double cardHeight = constraints.maxWidth > 1150 ? 700 : 500;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Stack(children: [
            AnimatedBuilder(
                animation: _colorFilterAnimationController.view,
                builder: (context, child) {
                  return ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        _colorFilterAnimation.value, BlendMode.modulate),
                    child: Table(
                      columnWidths: {
                        0: FixedColumnWidth(fixedColumnWidthValue),
                        1: FixedColumnWidth(fixedColumnWidthValue),
                        2: FixedColumnWidth(fixedColumnWidthValue),
                        3: FixedColumnWidth(centerFixedColumnWidthValue),
                        4: FixedColumnWidth(fixedColumnWidthValue),
                        5: FixedColumnWidth(fixedColumnWidthValue),
                        6: FixedColumnWidth(fixedColumnWidthValue),
                      },
                      children: [
                        TableRow(children: [
                          Container(
                            height: cardHeight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                buildCard(cardSize, cardSize,
                                    color: Colors.red),
                                buildCard(cardSize, cardSize,
                                    color: Colors.red[300]),
                                buildCard(cardSize, cardSize,
                                    color: Colors.red[100]),
                              ],
                            ),
                          ),
                          Container(
                            height: cardHeight,
                            child: Column(
                              children: [
                                buildCard(cardSize, cardSize,
                                    color: Colors.indigoAccent[400]),
                                buildCard(cardSize, cardSize,
                                    color: Colors.indigoAccent[200]),
                                buildCard(cardSize, cardSize,
                                    color: Colors.indigoAccent[100]),
                              ],
                            ),
                          ),
                          Container(
                            height: cardHeight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildCard(cardSize, cardSize,
                                    color: Colors.blueGrey),
                                buildCard(cardSize, cardSize,
                                    color: Colors.blueGrey[300]),
                                buildCard(cardSize, cardSize,
                                    color: Colors.blueGrey[100]),
                              ],
                            ),
                          ),
                          Container(
                            height: cardHeight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildCard(centerCardSize, centerCardSize),
                              ],
                            ),
                          ),
                          Container(
                            height: cardHeight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildCard(cardSize, cardSize,
                                    color: Colors.lightBlue),
                                buildCard(cardSize, cardSize,
                                    color: Colors.lightBlue[300]),
                                buildCard(cardSize, cardSize,
                                    color: Colors.lightBlue[100]),
                              ],
                            ),
                          ),
                          Container(
                            height: cardHeight,
                            child: Column(
                              children: [
                                buildCard(cardSize, cardSize,
                                    color: Colors.deepPurple),
                                buildCard(cardSize, cardSize,
                                    color: Colors.deepPurple[300]),
                                buildCard(cardSize, cardSize,
                                    color: Colors.deepPurple[100]),
                              ],
                            ),
                          ),
                          Container(
                            height: cardHeight,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                buildCard(cardSize, cardSize,
                                    color: Colors.orange),
                                buildCard(cardSize, cardSize,
                                    color: Colors.orange[300]),
                                buildCard(cardSize, cardSize,
                                    color: Colors.orange[100]),
                              ],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          SizedBox(),
                          SizedBox(),
                          SizedBox(),
                          SizedBox(
                            width: centerCardSize,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'This is title',
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'This is subtitle',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'This is content',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(),
                          SizedBox(),
                          SizedBox(),
                        ])
                      ],
                    ),
                  );
                }),
          ]),
        );
      }),
    );
  }

  Widget buildCard(width, height, {Color? color, Widget? widget}) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: color ?? Colors.grey.withOpacity(0.1),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 20,
                  color: Colors.grey.withOpacity(0.8),
                  blurStyle: BlurStyle.outer),
            ],
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: widget,
        ),
      ),
    );
  }
}