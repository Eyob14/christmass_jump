import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../gameComponents/gift.dart';
import '../gameComponents/obstacle.dart';
import '../gameComponents/playing_ball.dart';
import '../utils/constants.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int gift = 0;
  double ballYAxis = 1;
  double ballXAxis = 0;
  int index = 0;
  bool isGameOver = false;
  double obstacleX = 0.5;
  double obstacleY = -0.5;
  double giftX = 0.5;
  double giftY = -1;
  Random random = Random();

  void startGame() {
    gift = 0;
    ballYAxis = 1;
    obstacleX = random.nextDouble();
    obstacleY = -1;
    giftX = random.nextDouble();
    giftY = -1;
    index = random.nextInt(4);
    isGameOver = false;
    ballXAxis = 0;
    ballYAxis = 1;

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        obstacleY += 0.05;
        giftY += 0.05;
        // if the box get out of the screen
        if (obstacleY > 1.2) {
          obstacleY = -1;
          obstacleX = random.nextDouble();
          index = random.nextInt(4);
        }

        if (giftY > 1.2) {
          giftY = -1;
          giftX = random.nextDouble();
        }

        if ((ballYAxis - giftY).abs() < 0.07 &&
            (ballXAxis - giftX).abs() < 0.07) {
          giftY = -1;
          gift++;
        }

        if ((ballYAxis - obstacleY).abs() < 0.1 &&
            (ballXAxis - obstacleX).abs() < 0.1) {
          isGameOver = true;
          timer.cancel();
          Navigator.pushReplacementNamed(context, gameOver, arguments: gift);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startGame();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(gameBackgroundImage),
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
                    width: screenWidth * 0.18,
                    height: screenWidth * 0.18,
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
            body: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: GestureDetector(
                    // the ball movement with time
                    onPanUpdate: (details) {
                      setState(() {
                        ballXAxis += details.delta.dx /
                            MediaQuery.of(context).size.width *
                            2;
                        ballYAxis += details.delta.dy /
                            MediaQuery.of(context).size.width *
                            2;

                        if (ballXAxis < -1) ballXAxis = -1;
                        if (ballXAxis > 1) ballXAxis = 1;
                        if (ballYAxis < -1) ballYAxis = -1;
                        if (ballYAxis > 1) ballYAxis = 1;
                      });
                    },

                    child: Stack(
                      children: [
                        AnimatedContainer(
                          alignment: Alignment(giftX, giftY),
                          duration: Duration(milliseconds: 0),
                          // color: Colors.white,
                          child: Gift(),
                        ),
                        AnimatedContainer(
                          alignment: Alignment(obstacleX, obstacleY),
                          duration: Duration(milliseconds: 0),
                          // color: Colors.white,
                          child: Obstacle(
                            index: index,
                          ),
                        ),
                        AnimatedContainer(
                          alignment: Alignment(ballXAxis, ballYAxis),
                          duration: Duration(milliseconds: 0),
                          child: PlayingBall(),
                        ),
                        Container(
                          alignment: const Alignment(0, -1),
                          child: Text(
                            "${AppLocalizations.of(context)!.gifts} $gift",
                            style: TextStyle(
                              fontFamily: "BerkshireSwash",
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFC52321),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Container(
                          width: screenWidth * 0.18,
                          height: screenWidth * 0.18,
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
                          width: screenWidth * 0.18,
                          height: screenWidth * 0.18,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
