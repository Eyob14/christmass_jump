import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/constants.dart';
import '../utils/sound_manger.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                automaticallyImplyLeading: false,
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 13.5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: screen_height * 0.2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(christmass),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: screen_width * 0.7,
                            height: screen_height * 0.08,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(playButtonImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          onTap: () {
                            SoundManager.playButtonClickSound();
                            Navigator.pushNamed(context, game);
                            SoundManager.playGameSound();
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        GestureDetector(
                          child: Text(
                            "${AppLocalizations.of(context)!.howToPlay1} ${AppLocalizations.of(context)!.howToPlay2}",
                            style: TextStyle(
                              fontFamily: "BerkshireSwash",
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              color: Color(0xFFC52321),
                            ),
                          ),
                          onTap: () {
                            SoundManager.playButtonClickSound();
                            Navigator.pushNamed(context, help);
                          },
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
                              SoundManager.playButtonClickSound();
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
                              SoundManager.playButtonClickSound();
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
