import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:minder/consts/colors.dart';
import 'package:minder/ui/screens/home_screen.dart';
import 'package:minder/ui/screens/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 200,
        duration: 2000,
        splash: Image.asset('assets/images/logo.png'),
        nextScreen: OnBoarding(),
        animationDuration: Duration(seconds:1),
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.scaleTransition,
      ),
    );
  }
}

