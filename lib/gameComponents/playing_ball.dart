import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';

class PlayingBall extends StatelessWidget {
  final String? selectedBallName;
  const PlayingBall({super.key, required this.selectedBallName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 8.h,
      height: 8.h,
      child: selectedBallName != null
          ? Image.asset(selectedBallName!)
          : Image.asset(firstBall),
    );
  }
}
