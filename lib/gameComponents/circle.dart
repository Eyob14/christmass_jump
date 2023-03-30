import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircleObstacle extends StatelessWidget {
  const CircleObstacle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 172, 170, 170), shape: BoxShape.circle),
      width: 30.w,
      height: 30.w,
    );
  }
}
