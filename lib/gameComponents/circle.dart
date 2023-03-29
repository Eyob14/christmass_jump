import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircleObstacle extends StatefulWidget {
  const CircleObstacle({super.key});

  @override
  State<CircleObstacle> createState() => _CircleObstacleState();
}

class _CircleObstacleState extends State<CircleObstacle> {
  double width_ = 25.w;
  double height_ = 25.w;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    int _width = random.nextInt(30);
    width_ = (_width + 10).w;
    height_ = (random.nextInt(30) + _width).w;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      width: width_,
      height: height_,
    );
  }
}
