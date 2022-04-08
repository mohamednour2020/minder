import 'package:flutter/material.dart';
import 'package:minder/consts/colors.dart';
import 'package:minder/ui/screens/home_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/easy_on_boarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return EasyOnboarding(
      onStart: () {
        print("getting started ");
      },
      skipButtonColor: Colors.transparent,
      backButtonColor: Colors.transparent,
      nextButtonColor: Colors.transparent,
      backgroundColor: Colors.white,
      indicatorSelectedColor: mainColor,
      indicatorUnselectedColor: mainColor2,
      startButtonColor: Colors.white,
      nextButtonIcon: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      skipButtonText: const Text(
        'Skip',
        style: TextStyle(fontSize: 24.0, color: Colors.black),
      ),
      startButtonText: const Text(
        'Get Started',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
      backButtonIcon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      children: [
        Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              child: Image.asset('assets/images/onboarding2.png'),
              height: 250,
              width: MediaQuery.of(context).size.width - 26,
            ),
            Container(
              child: Image.asset('assets/images/text.png'),
              height: 100,
              width: MediaQuery.of(context).size.width - 26,
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              child: Image.asset('assets/images/onboarding1.png'),
              height: 400,
              width: MediaQuery.of(context).size.width - 26,
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Container(
              child: Image.asset('assets/images/onboarding3.png'),
              height: 400,
              width: MediaQuery.of(context).size.width - 26,
            ),
            const SizedBox(
              height: 55,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => HomeScreen()),
                    (route) => false);
              },
              height: 66,
              borderRadius: 10,
              text: 'Get started', fontBold: false,
            )
          ],
        ),
      ],
    );
  }
}
