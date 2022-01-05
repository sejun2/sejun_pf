import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SejunCard extends StatefulWidget {
  const SejunCard(
      {Key? key,
      required this.labelText,
      this.imagePath = "https://dummyimage.com/1200x400/000/fff",
      required this.title,
      required this.content})
      : super(key: key);

  final String labelText;
  final String imagePath;
  final String title;
  final String content;

  @override
  _SejunCardState createState() => _SejunCardState();
}

class _SejunCardState extends State<SejunCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
          margin: const EdgeInsets.only(top: 14, bottom: 16),
          color: Colors.white,
          elevation: 4,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
          child: SizedBox(
            width: Get.width,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 4,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32)),
                      child: Container(
                        width: Get.width,
                        child: Image.network(
                          widget.imagePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    )),
                Container(
                  width: Get.width,
                  height: 1,
                  color: Colors.grey,
                ),
                Expanded(flex: 1, child: Text(widget.title)),
                Expanded(flex: 1, child: Text(widget.content))
              ],
            ),
          )),
      Positioned(
          top: 0,
          left: 0,
          child: Chip(
              backgroundColor: Colors.blueGrey,
              labelStyle: TextStyle(color: Colors.white),
              label: Text('${widget.labelText}')))
    ]);
  }
}
