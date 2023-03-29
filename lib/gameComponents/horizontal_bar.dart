import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HorizontalBar extends StatefulWidget {
  const HorizontalBar({super.key});

  @override
  State<HorizontalBar> createState() => _HorizontalBarState();
}

class _HorizontalBarState extends State<HorizontalBar> {
  double width_ = 100;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    width_ = (random.nextInt(30) + 30).w;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width_,
      height: 10.h,
      color: Colors.white,
    );
  }
}
