import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Card1Page extends GetView {
  final _topWidgetHeight = 240.0;

  const Card1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (ctx, constraints) {
        return SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                buildAppBar(constraints),
                // buildTop(constraints),
                Container(
                  height: 1500,
                  width: constraints.maxWidth,
                  color: Colors.red,
                )
              ],
            )
          ]),
        );
      }),
    );
  }
  
  buildAppBar(BoxConstraints constraints){
    return Container(
      width: constraints.maxWidth,
      height: kTextTabBarHeight,
      color: Colors.transparent,
      child: Row(
        children: [
          IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,))
        ],
      ),
    );
  }
  
  Padding buildTop(BoxConstraints constraints) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          child: Opacity(
            opacity: 0.85,
            child: SizedBox(
              width: constraints.maxWidth,
              height: _topWidgetHeight,
              child: Hero(
                  tag: 'card1',
                  child: Image.network(
                    'https://dummyimage.com/1200x400/000/fff',
                    width: Get.width,
                    fit: BoxFit.fill,
                  )),
            ),
          ),
        ),
        Positioned(
          top: 12,
          left: 12,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              splashRadius: 28,
              icon: Icon(Icons.arrow_back_ios_new)),
        )
      ]),
    );
  }
}
