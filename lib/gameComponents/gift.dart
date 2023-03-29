import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';

class Gift extends StatelessWidget {
  const Gift({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 5.h,
      height: 5.h,
      child: Image.asset(giftImage),
    );
  }
}
