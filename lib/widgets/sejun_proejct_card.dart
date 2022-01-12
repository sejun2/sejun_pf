import 'package:flutter/material.dart';

class SejunProjectCard extends StatefulWidget {
  const SejunProjectCard({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SejunProjectCardState createState() => _SejunProjectCardState();
}

class _SejunProjectCardState extends State<SejunProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0.0,
        upperBound: 5.0);
    _animation = Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            onHover: (bool) {
              setState(() {
                if (bool) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
            },
            onTap: () {},
            child: Stack(
              children: [
                AnimatedBuilder(
                    animation: _animation,
                    builder: (context, widget) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24)),
                            gradient: RadialGradient(
                                colors: const [Colors.blue, Colors.white],
                                radius: _animationController.value,
                                center: Alignment.bottomLeft)),
                        height: 500,
                        width: 500,
                      );
                    }),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: EdgeInsets.all(58),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: Image.network(
                              'https://dummyimage.com/600x400/000/fff',
                              width: 350,
                              height: 200),
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 46),
                        ),
                        Text(
                          'Read more   >',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
