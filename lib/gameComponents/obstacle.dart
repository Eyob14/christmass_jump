import 'dart:math';

import 'package:christmass_jump/gameComponents/circle.dart';
import 'package:christmass_jump/gameComponents/rectangle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'gift.dart';
import 'haf_circle.dart';
import 'horizontal_bar.dart';
import 'obstacle_list.dart';

class Obstacle extends StatelessWidget {
  final int index;
  Obstacle({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return obstacles[index]!;
  }
}
