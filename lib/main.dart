import 'package:flutter/material.dart';
import 'package:rahove/commponents/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:rahove/provider/gesture_detector.dart';
import 'package:rahove/screen/home_screen.dart';
import 'package:rahove/screen/login_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'provider/profile_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProfileProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => GestureDetectorProvider(),
          ),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "HandoSoft",
          ),
          home: MyStatefulWidget(),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image.asset('assets/img/logo.png'),
        duration: 3000,
        splashIconSize: 350,
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: Duration(milliseconds: 1500),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        pageTransitionType: PageTransitionType.topToBottom,
        nextScreen: LoginPage());
  }
}

// late final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 2),
//     vsync: this,
//   );
//   late final Animation<double> _animation = CurvedAnimation(
//     parent: _controller,
//     curve: Curves.fastOutSlowIn,
//   );