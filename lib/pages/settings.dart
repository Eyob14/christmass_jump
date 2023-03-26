import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/constants.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                    onTap: () => Navigator.of(context).pop(),
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
                      "Settings",
                      style: TextStyle(
                        fontFamily: "BerkshireSwash",
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFC52321),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "Music",
                          style: TextStyle(
                            fontFamily: "BerkshireSwash",
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFFC52321),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                width: screen_width * 0.15,
                                height: screen_width * 0.15,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(musicOn),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            GestureDetector(
                              child: Container(
                                width: screen_width * 0.15,
                                height: screen_width * 0.15,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(musicOff),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Language",
                          style: TextStyle(
                            fontFamily: "BerkshireSwash",
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC52321),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                width: screen_width * 0.15,
                                height: screen_width * 0.15,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(englishOn),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            GestureDetector(
                              child: Container(
                                width: screen_width * 0.15,
                                height: screen_width * 0.15,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(englishOff),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                          ],
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
