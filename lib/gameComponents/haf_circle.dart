import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';

class HalfCircle extends StatefulWidget {
  const HalfCircle({super.key});

  @override
  State<HalfCircle> createState() => _HalfCircleState();
}

class _HalfCircleState extends State<HalfCircle> {
  double width_ = 25.w;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    int _width = random.nextInt(30);
    width_ = (_width + 10).w;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width_,
      height: 25.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(halfCircle),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
