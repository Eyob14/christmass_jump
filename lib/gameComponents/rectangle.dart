import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RectangleObstacle extends StatelessWidget {
  const RectangleObstacle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 195, 189, 189), shape: BoxShape.rectangle),
      width: 35.w,
      height: 10.h,
    );
  }
}
