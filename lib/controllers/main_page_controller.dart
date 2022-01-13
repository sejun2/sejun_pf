import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController
    with GetTickerProviderStateMixin {
  final _contentScrollViewController =
      ScrollController(keepScrollOffset: false);

  getContentScrollViewController() => _contentScrollViewController;

  final _isContentScrollViewTop = true.obs;

  getIsContentScrollViewTop() => _isContentScrollViewTop.value;

  final _introductionIndex = 0.obs;

  setIntroductionIndex(int index) {
    assert(index >= 0 && index <= 3);

    _introductionIndex.value = index;
  }

  getIntroductionIndex() => _introductionIndex.value;

  @override
  void onInit() {
    _contentScrollViewController.addListener(() {
      Get.log(_contentScrollViewController.position.pixels.toString());
      if (_contentScrollViewController.position.userScrollDirection ==
              ScrollDirection.forward &&
          _contentScrollViewController.position.pixels <= 0.0) {
        _isContentScrollViewTop.value = true;
      } else {
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
