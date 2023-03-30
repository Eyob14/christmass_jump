import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';

class GiftPrice extends StatelessWidget {
  final int price;
  final bool? isBought;

  GiftPrice({super.key, required this.price, required this.isBought});

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return isBought == false
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price.toString(),
                style: TextStyle(
                  fontFamily: "BerkshireSwash",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFFC52321),
                ),
              ),
              SizedBox(
                width: 1.5.w,
              ),
              Container(
                width: screen_width * 0.1,
                height: screen_width * 0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(giftImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
