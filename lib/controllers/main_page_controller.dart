import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  final _isPersonalExpanded = false.obs;
  final _contentScrollViewController = ScrollController(keepScrollOffset: false );

  final _isContentScrollViewTop = true.obs;

  setIsPersonalExpanded(bool bool) {
    _isPersonalExpanded.value = bool;
  }

  getIsPersonalExpanded() => _isPersonalExpanded.value;

  getContentScrollViewController() => _contentScrollViewController;

  getIsContentScrollViewTop() => _isContentScrollViewTop.value;

  @override
  void onInit() {
    _isPersonalExpanded.listen((value) {
      Get.log('isPersonalExpanded :: $value');
    });

    _contentScrollViewController.addListener(() {
      Get.log(_contentScrollViewController.position.atEdge.toString());
      if (_contentScrollViewController.position.atEdge &&
          _contentScrollViewController.position.userScrollDirection ==
              ScrollDirection.forward) {
        _isContentScrollViewTop.value = true;
      }
      else {
        _isContentScrollViewTop.value = false;
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    _contentScrollViewController.dispose();
    super.dispose();
  }
}
