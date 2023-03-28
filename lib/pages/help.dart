import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/constants.dart';
import '../utils/sound_manger.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(decorationImage),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                shape: const Border(
                  bottom: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                automaticallyImplyLeading: true,
                leading: Padding(
                  padding: EdgeInsets.only(left: 6.w, top: 2.h),
                  child: GestureDetector(
                    child: Container(
                      width: screen_width * 0.18,
                      height: screen_width * 0.18,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(backButton),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    onTap: () {
                      SoundManager.playButtonClickSound();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                leadingWidth: 28.w,
                toolbarHeight: 9.h,
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.howToPlay,
                      style: TextStyle(
                        fontFamily: "BerkshireSwash",
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFC52321),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: screen_width * 0.88,
                          height: screen_width * 0.88,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: screen_width * 0.78,
                          height: screen_width * 0.78,
                          child: Stack(
                            children: [
                              Container(
                                width: screen_width * 0.78,
                                height: screen_width * 0.78,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(howToPlayImage),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                bottom: 10,
                                left: 10,
                                right: 10,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 4.w, top: 2.2.w, bottom: 2.2.w),
                                  width: screen_width * 0.5,
                                  height: screen_width * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    AppLocalizations.of(context)!.howToPlayText,
                                    style: TextStyle(
                                      fontFamily: "BerkshireSwash",
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: screen_width * 0.18,
                            height: screen_width * 0.18,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(howToPlayImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: screen_width * 0.18,
                              height: screen_width * 0.18,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(settingPageImage),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, setting);
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: screen_width * 0.18,
                              height: screen_width * 0.18,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(giftPageImage),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, shop);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
