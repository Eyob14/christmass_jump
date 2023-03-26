import 'package:christmass_jump/pages/game.dart';
import 'package:christmass_jump/pages/game_over.dart';
import 'package:christmass_jump/pages/home.dart';
import 'package:christmass_jump/pages/settings.dart';
import 'package:christmass_jump/pages/shop.dart';
import 'package:christmass_jump/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Christmass Jump',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case home:
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const Home(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                );
              case setting:
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const Settings(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                );
              case gameOver:
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const GameOver(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                );
              case shop:
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const Shop(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                );
              case game:
                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const Game(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                );
              default:
                return null;
            }
          },
          initialRoute: home,
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     late final String screenTypeText;

//     switch (Device.screenType) {
//       case ScreenType.mobile:
//         screenTypeText = "My screen's type is Mobile";
//         break;
//       case ScreenType.tablet:
//         screenTypeText = "My screen's type is Tablet";
//         break;
//       // ScreenType can only be desktop when `maxTabletWidth`
//       // is set in `ResponsiveSizer`
//       case ScreenType.desktop:
//         screenTypeText = "My screen's type is Desktop";
//         break;
//     }

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: Adaptive.h(12.5), // or 12.5.h
//             width: 50.w, // or Adaptive.w(50)
//             color: Colors.black,
//           ),
//           Text(
//             "This text is responsive",
//             style: TextStyle(fontSize: 18.sp), // or Adaptive.sp(12)
//           ),
//           Text(
//             "w=${100.w} h=${100.h}",
//             style: TextStyle(fontSize: 12.sp),
//           ),
//           Device.orientation == Orientation.portrait
//               ? Text("My orientation is Portrait")
//               : Text("My orientation is Landscape"),
//           Text(screenTypeText),
//         ],
//       ),
//     );
//   }
// }
