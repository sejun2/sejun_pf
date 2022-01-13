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

  final _appBarTitleAlignment = Alignment.center.obs;

  getAppBarTitleAlignment() => _appBarTitleAlignment.value;

  final _appBarOpacity = 0.0.obs;

  getAppBarOpacity() => _appBarOpacity.value;

  getMainBannerTitleOpacity() {
    if (getAppBarOpacity() == 1.0) {
      return 0.0;
    } else {
      return 1.0;
    }
  }

  late AnimationController cardAnimationController;

  initAnimationResources() {
   cardAnimationController =  AnimationController(vsync: this, duration: Duration(milliseconds: 700));
  }

  @override
  void onInit() {
    initAnimationResources();

    _contentScrollViewController.addListener(() {
      if (_contentScrollViewController.position.userScrollDirection ==
              ScrollDirection.forward &&
          _contentScrollViewController.position.pixels <= 0.0) {
        _isContentScrollViewTop.value = true;
        _appBarOpacity.value = 0.0;
      } else {
        _isContentScrollViewTop.value = false;
        _appBarOpacity.value = 1.0;
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    _contentScrollViewController.dispose();
    cardAnimationController.dispose();
    super.dispose();
  }
}
