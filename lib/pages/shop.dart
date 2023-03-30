import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import '../utils/gift_card_model.dart';
import '../utils/shared_preference.dart';
import '../utils/sound_manger.dart';
import '../widgets/gift_price.dart';

class Shop extends StatefulWidget {
  final playingBallsNames = {
    1: secondBall,
    2: thirdBall,
    3: fourthBall,
  };
  Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  static int? _gifts;
  static String? _selectedBallName;

  static bool? _isSecondBallBought;
  static bool? _isThirdBallBought;
  static bool? _isFourthBallBought;

  void allGifts() async {
    final value = await SharedPreferenceHelper.getGifts();
    setState(() {
      _gifts = value;
    });
  }

  void selectedBall() async {
    final value = await SharedPreferenceHelper.getSelectedBall();
    setState(() {
      _selectedBallName = value;
    });
  }

  void isBallBought() async {
    final second = await SharedPreferenceHelper.getSecondBallBought();
    final third = await SharedPreferenceHelper.getThirdBallBought();
    final fourth = await SharedPreferenceHelper.getFourthBallBought();

    setState(() {
      _isSecondBallBought = second;
      _isThirdBallBought = third;
      _isFourthBallBought = fourth;
    });
  }

  void newBallSelected(String ball) async {
    await SharedPreferenceHelper.setSelectedBall(ball);
  }

  void newPlayingBallSelected(String newBall) async {
    await SharedPreferenceHelper.setSelectedPlayingBall(newBall);
  }

  void buyNewBall(int ballPrice, int index) async {
    if (_gifts != null) {
      int newValue = _gifts!.toInt() - ballPrice;
      await SharedPreferenceHelper.setGifts(newValue);
    }

    switch (index) {
      case 1:
        await SharedPreferenceHelper.setSecondBallBought(true);
        break;
      case 2:
        await SharedPreferenceHelper.setThirdBallBought(true);
        break;
      case 3:
        await SharedPreferenceHelper.setFourthBallBought(true);
    }
  }

  bool? whichBall(int index) {
    print("$_isSecondBallBought, $_isThirdBallBought, $_isFourthBallBought");
    print("$_gifts gifts");
    if (index == 1) {
      return _isSecondBallBought;
    } else if (index == 2) {
      return _isThirdBallBought;
    } else if (index == 3) {
      return _isFourthBallBought;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
    selectedBall();
    allGifts();
    isBallBought();
  }

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    final giftCards = [
      GiftCardModel(image: firstGift, price: 40),
      GiftCardModel(image: secondGift, price: 40),
      GiftCardModel(image: thirdGift, price: 80),
      GiftCardModel(image: fourthGift, price: 140),
    ];

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
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(backgroundImage),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
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
                padding: EdgeInsets.only(top: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.shop,
                          style: TextStyle(
                            fontFamily: "BerkshireSwash",
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFC52321),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _gifts.toString(),
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
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screen_width * 0.8,
                      height: screen_width * 0.8,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: giftCards.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                if (_gifts! >= giftCards[index].price) {
                                  buyNewBall(giftCards[index].price, index);
                                  newBallSelected(giftCards[index].image);
                                  if (index > 0) {
                                    newPlayingBallSelected(
                                        widget.playingBallsNames[index]!);
                                  }
                                  setState(() {
                                    _selectedBallName = giftCards[index].image;
                                  });
                                } else if (whichBall(index) == true) {
                                  newBallSelected(giftCards[index].image);
                                  setState(() {
                                    _selectedBallName = giftCards[index].image;
                                  });
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: screen_width * 0.18,
                                    height: screen_width * 0.18,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage(giftCards[index].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  _selectedBallName == giftCards[index].image
                                      ? Text(
                                          AppLocalizations.of(context)!
                                              .selected,
                                          style: TextStyle(
                                            fontFamily: "BerkshireSwash",
                                            fontSize: 23.sp,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xFFC52321),
                                          ),
                                        )
                                      : GiftPrice(
                                          isBought: whichBall(index),
                                          price: giftCards[index].price,
                                        ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
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
