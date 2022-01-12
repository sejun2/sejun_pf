import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController with GetTickerProviderStateMixin{
  final _isPersonalExpanded = false.obs;
  final _contentScrollViewController =
      ScrollController(keepScrollOffset: false);

  final _isContentScrollViewTop = true.obs;

  final _introductionIndex = 0.obs;

  setIntroductionIndex(int index) {
    assert(index >= 0 && index <= 3);

    _introductionIndex.value = index;
  }

  getIntroductionIndex() => _introductionIndex.value;

  setIsPersonalExpanded(bool bool) {
    _isPersonalExpanded.value = bool;
  }

  getIsPersonalExpanded() => _isPersonalExpanded.value;

  getContentScrollViewController() => _contentScrollViewController;

  getIsContentScrollViewTop() => _isContentScrollViewTop.value;

  late AnimationController _introductionAnimationController;
  late Animation _introductionAnimation;


  initAnimationResources(){
    _introductionAnimationController = AnimationController(vsync: this);
  }

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
      } else {
        _isContentScrollViewTop.value = false;
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    _contentScrollViewController.dispose();
    _introductionAnimationController.dispose();
    super.dispose();
  }
}
