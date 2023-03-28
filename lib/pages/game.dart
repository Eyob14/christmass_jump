import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/constants.dart';
import '../widgets/barrier.dart';
import '../widgets/playing_ball.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int gift = 0;
  static double ballYAxis = 0.7;
  double time = 0;
  double height = 0;
  double initialHeight = ballYAxis;
  bool gameStarted = false;
  static double barrierYOne = -0.5;
  static double barrierYTwo = barrierYOne - 5.5;
  double barrierYThree = barrierYTwo - 5.5;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = ballYAxis;
    });
  }

  void startGame() {
    gameStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.02;
      height = -4 * time * time + 2 * time;
      if (initialHeight - height < -0.98) {
        setState(() {
          ballYAxis = -0.8;
        });
      } else {
        setState(() {
          ballYAxis = initialHeight - height;
        });
      }

      setState(() {
        if (barrierYOne > 1.1) {
          barrierYOne = -3.1;
        } else {
          barrierYOne += 0.01;
        }
      });

      setState(() {
        if (barrierYTwo > 1.1) {
          barrierYTwo = -3.1;
        } else {
          barrierYTwo += 0.01;
        }
      });
      setState(() {
        if (barrierYThree > 1.1) {
          barrierYThree = -3.1;
        } else {
          barrierYThree += 0.01;
        }
      });

      if (ballYAxis >= 0.8) {
        timer.cancel();
        gameStarted = false;
        // TODO: here is one of the conditons to end the game
        Navigator.popAndPushNamed(context, gameOver);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: GestureDetector(
                onTap: () {
                  if (gameStarted) {
                    jump();
                  } else {
                    startGame();
                  }
                },
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, ballYAxis),
                      color: Colors.blue,
                      duration: Duration(milliseconds: 0),
                      child: PlayingBall(),
                    ),
                    Container(
                      alignment: Alignment(0, -0.3),
                      child: gameStarted
                          ? const Text("")
                          : Text(
                              "TAP TO PLAY",
                              style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.white,
                              ),
                            ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(-1.1, barrierYOne),
                      duration: Duration(milliseconds: 0),
                      child: Barrier(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(1.1, barrierYOne),
                      duration: Duration(milliseconds: 0),
                      child: Barrier(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(-1.1, barrierYTwo),
                      duration: Duration(milliseconds: 0),
                      child: Barrier(
                        size: 160.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(1.1, barrierYTwo),
                      duration: Duration(milliseconds: 0),
                      child: Barrier(
                        size: 100.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(-1.1, barrierYThree),
                      duration: Duration(milliseconds: 0),
                      child: Barrier(
                        size: 50.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(1.1, barrierYThree),
                      duration: Duration(milliseconds: 0),
                      child: Barrier(
                        size: 150.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}


// child: Stack(
//           children: [
//             Container(
//               constraints: const BoxConstraints.expand(),
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(gameBackgroundImage),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Container(
//                 constraints: const BoxConstraints.expand(),
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(decorationImage),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ),
//             Scaffold(
//               backgroundColor: Colors.transparent,
//               appBar: AppBar(
//                 elevation: 0,
//                 backgroundColor: Colors.transparent,
//                 shape: const Border(
//                   bottom: BorderSide(
//                     color: Colors.transparent,
//                   ),
//                 ),
//                 automaticallyImplyLeading: true,
//                 leading: Padding(
//                   padding: EdgeInsets.only(left: 6.w, top: 2.h),
//                   child: GestureDetector(
//                     child: Container(
//                       width: screen_width * 0.18,
//                       height: screen_width * 0.18,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(backButton),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                     onTap: () => Navigator.of(context).pop(),
//                   ),
//                 ),
//                 leadingWidth: 28.w,
//                 toolbarHeight: 9.h,
//               ),
//               body: Padding(
//                 padding: EdgeInsets.only(top: 2.h),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text(
//                       "${AppLocalizations.of(context)!.gifts} $gift",
//                       style: TextStyle(
//                         fontFamily: "BerkshireSwash",
//                         fontSize: 28.sp,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xFFC52321),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 6.w),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             child: Container(
//                               width: screen_width * 0.18,
//                               height: screen_width * 0.18,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                   image: AssetImage(settingPageImage),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.pushNamed(context, setting);
//                             },
//                           ),
//                           GestureDetector(
//                             child: Container(
//                               width: screen_width * 0.18,
//                               height: screen_width * 0.18,
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                   image: AssetImage(giftPageImage),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                             onTap: () {
//                               Navigator.pushNamed(context, shop);
//                             },
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         )