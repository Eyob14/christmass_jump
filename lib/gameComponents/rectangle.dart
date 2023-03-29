import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RectangleObstacle extends StatefulWidget {
  const RectangleObstacle({super.key});

  @override
  State<RectangleObstacle> createState() => _RectangleObstacleState();
}

class _RectangleObstacleState extends State<RectangleObstacle> {
  double width_ = 25.w;
  double height_ = 10.h;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    width_ = (random.nextInt(50) + 10).w;
    height_ = (random.nextInt(20) + 10).h;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.rectangle),
      width: width_,
      height: height_,
    );
  }
}
