import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SejunCard extends StatefulWidget {
  const SejunCard({Key? key, required this.labelText}) : super(key: key);

  final String labelText;

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
