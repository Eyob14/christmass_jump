import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/constants.dart';
import '../utils/shared_preference.dart';
import '../utils/sound_manger.dart';

class GameOver extends StatefulWidget {
  final int gifts;
  const GameOver({super.key, required this.gifts});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  int? _currentGifts;

  void retrieveTotalScore() async {
    final int? value = await SharedPreferenceHelper.getGifts();
    setState(() {
      _currentGifts = value;
    });
  }

  Future<void> saveNewGifts() async {
    if (_currentGifts != null) {
      int newValue = _currentGifts!.toInt() + widget.gifts;
      await SharedPreferenceHelper.setGifts(newValue);
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveTotalScore();
  }

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
                      saveNewGifts();
                      SoundManager.playButtonClickSound();
                      Navigator.pushNamedAndRemoveUntil(
                          context, home, (route) => false);
                    },
                  ),
                ),
                leadingWidth: 28.w,
                toolbarHeight: 9.h,
              ),
              body: Padding(
                padding: EdgeInsets.only(top: 13.5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.gameOver,
                          style: TextStyle(
                            fontFamily: "BerkshireSwash",
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFC52321),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!.yourGifts,
                              style: TextStyle(
                                fontFamily: "BerkshireSwash",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w900,
                                color: Color(0xFFC52321),
                              ),
                            ),
                            Text(
                              widget.gifts != null
                                  ? widget.gifts.toString()
                                  : "0",
                              style: TextStyle(
                                fontFamily: "BerkshireSwash",
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFC52321),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        GestureDetector(
                          child: Container(
                            width: screen_width * 0.5,
                            height: screen_height * 0.069,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(playButtonImage),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          onTap: () {
                            saveNewGifts();
                            SoundManager.playButtonClickSound();
                            Navigator.popAndPushNamed(context, game);
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 6.w, right: 6.w, bottom: 2.h),
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
                              saveNewGifts();
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
                              saveNewGifts();
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
