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
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int? _gifts;
  String? _selectedBallName;

  void allGifts() async {
    final value = await SharedPreferenceHelper.getGifts();
    setState(() {
      _gifts = value;
    });
  }

  Future<void> selectedBall() async {
    final value = await SharedPreferenceHelper.getSelectedBall();
    setState(() {
      _selectedBallName = value;
    });
  }

  void newBallSelected(String ball) async {
    await SharedPreferenceHelper.setSelectedBall(ball);
  }

  @override
  void initState() {
    super.initState();
    selectedBall();
    allGifts();
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
                        GiftPrice(
                          price: _gifts,
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
                                  newBallSelected(giftCards[index].image);
                                  _selectedBallName = giftCards[index].image;
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
                                          price: giftCards[index].price),
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
