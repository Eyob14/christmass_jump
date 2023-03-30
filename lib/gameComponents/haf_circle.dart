import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';

class HalfCircle extends StatelessWidget {
  const HalfCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26.w,
      height: 15.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(halfCircle),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
