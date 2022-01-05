import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sejun_portf/controllers/main_page_controller.dart';
import 'package:sejun_portf/widgets/sejun_card.dart';

class MainPage extends GetView<MainPageController> {
  MainPage({Key? key}) : super(key: key);

  static const double _appBarHeight = 66.0;
  static const double _tabBarHeight = 40.0;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  StatelessElement createElement() {
    Get.put(() => MainPageController());
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
            buildContent(context),
          ],
        ),
      ),
    );
  }

  buildChips(BuildContext context) {
    return Wrap(
      children: [
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              elevation: 3,
              label: Text(
                'Chip',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              elevation: 3,
              label: Text(
                'Chip',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              elevation: 3,
              label: Text(
                'Chip',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              elevation: 3,
              label: Text(
                'Chip',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              elevation: 3,
              label: Text(
                'Chip',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              elevation: 3,
              label: Text(
                'Chip',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              elevation: 3,
              label: Text(
                'Chip',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              elevation: 3,
              label: Text(
                'Chip',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 8),
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SejunCard(
                title: 'TITLE',
                content: 'CONTENT',
                labelText: 'THIS IS LABEL',
              ),
              SejunCard(
                title: 'TITLE',
                content: 'CONTENT',
                labelText: 'THIS IS LABEL',
              ),
              SejunCard(
                title: 'TITLE',
                content: 'CONTENT',
                labelText: 'THIS IS LABEL',
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      leading: Material(
        elevation: 2,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(54)),
          child: Image.network(
              "https://dummyimage.com/600x400/000/fff", fit: BoxFit.fitWidth, width: 24, height: 24,),
        ),
      ),
      toolbarHeight: _appBarHeight,
      elevation: 4,
      centerTitle: true,
      title: const Text('Sejun'),
      shape: const StadiumBorder(),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.g_translate)),
      ],
    );
  }
}
