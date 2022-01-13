import 'package:flutter/material.dart';

class SejunBannerCard extends StatefulWidget {
  const SejunBannerCard({Key? key}) : super(key: key);

  @override
  _SejunBannerCardState createState() => _SejunBannerCardState();
}

class _SejunBannerCardState extends State<SejunBannerCard> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (context, constraints) {
        double fixedColumnWidthValue =
        constraints.maxWidth > 1000 ? 160 : 110;
        double centerFixedColumnWidthValue =
        constraints.maxWidth > 1000 ? 340 : 240;
        double cardSize = constraints.maxWidth > 1000 ? 140 : 90;
        double centerCardSize = constraints.maxWidth > 1000 ? 340 : 200;
        double cardHeight = constraints.maxWidth > 1000 ? 700 : 500;

        return SingleChildScrollView(
          child: Stack(
              children: [Table(
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
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                        ],
                      ),
                    ),
                    Container(
                      height: cardHeight,
                      child: Column(
                        children: [
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                        ],
                      ),
                    ),
                    Container(
                      height: cardHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                        ],
                      ),
                    ),
                    Container(
                      height: cardHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCard(null, centerCardSize, centerCardSize),
                        ],
                      ),
                    ),
                    Container(
                      height: cardHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                        ],
                      ),
                    ),
                    Container(
                      height: cardHeight,
                      child: Column(
                        children: [
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                        ],
                      ),
                    ),
                    Container(
                      height: cardHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                          buildCard(null, cardSize, cardSize),
                        ],
                      ),
                    ),
                  ]),
                  TableRow(
                      children: [
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                        SizedBox(
                          width: centerCardSize,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('This is title', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),
                              Text('This is subtitle', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                              Text('This is content', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                      ]
                  )
                ],
              ),
              ]
          ),
        );
      }),
    );
  }

  Widget buildCard(Widget? widget, width, height) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 12,
                  color: Colors.grey.withOpacity(0.3),
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
