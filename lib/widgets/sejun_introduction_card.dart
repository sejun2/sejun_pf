import 'package:flutter/material.dart';

class SejunIntroductionCard extends StatefulWidget {
  const SejunIntroductionCard({Key? key, required this.title, required this.content, required this.animationController})
      : super(key: key);

  final String title;
  final String content;

  final AnimationController animationController;
  @override
  _SejunIntroductionCardState createState() => _SejunIntroductionCardState();
}

class _SejunIntroductionCardState extends State<SejunIntroductionCard>
    with SingleTickerProviderStateMixin {
  late Animation _opacityAnimation;
  late Animation _transformAnimation;

  initAnimationResources() {
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: widget.animationController, curve: Curves.fastOutSlowIn),
    );
    _transformAnimation = Tween(begin: 200.0, end: 0.0).animate(CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0, 1, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    initAnimationResources();
    Future.delayed(
        Duration(
          milliseconds: 100,
        ), () {
      print('forward...');
      widget.animationController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Container(
            transform:
                Matrix4.translationValues(0, _transformAnimation.value, 0),
            child: IntrinsicHeight(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.network(
                    'https://storage.googleapis.com/cms-storage-bucket/a667e994fc2f3e85de36.png',
                    width: 600,
                    height: 600,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 66, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Text(
                        widget.content,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      animation: widget.animationController.view,
    );
  }
}
