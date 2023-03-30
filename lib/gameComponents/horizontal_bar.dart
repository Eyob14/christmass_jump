import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 4.h,
      color: Colors.white,
    );
  }
}
