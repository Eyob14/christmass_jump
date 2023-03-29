import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/shared_preference.dart';

class PlayingBall extends StatefulWidget {
  const PlayingBall({super.key});

  @override
  State<PlayingBall> createState() => _PlayingBallState();
}

class _PlayingBallState extends State<PlayingBall> {
  String? _selectedBallName;

  void selectedBall() async {
    final value = await SharedPreferenceHelper.getSelectedPlayingBall();
    setState(() {
      _selectedBallName = value;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedBall();
  }

  @override
  Widget build(BuildContext context) {
    return _selectedBallName != null
        ? Image.asset(_selectedBallName!)
        : Image.asset(firstBall);
  }
}
