import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final size;
  const Barrier({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            width: 10,
            color: Colors.amber,
          )),
    );
  }
}
