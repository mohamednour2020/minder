import 'package:easy_onboarding/easy_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:minder/ui/screens/home_screen.dart';
import 'package:minder/ui/widgets/custom_buuton.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key ?key}) : super(key: key);

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

      indicatorSelectedColor: Colors.blueAccent,
      indicatorUnselectedColor: Colors.blueGrey,
      startButtonColor: Colors.white,
      nextButtonIcon: Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      skipButtonText: Text(
        'SKIP',
        style: TextStyle(fontSize: 15.0, color: Colors.black),
      ),
      startButtonText:const Text(
        'Get Started',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
      backButtonIcon: Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      children: [
        Container(
          child: Column(
            children: [
              SizedBox(height: 60,),
              Container(

                child: Image.asset('assets/images/onboarding2.png'),
                height: 400,
                width: MediaQuery.of(context).size.width-26,
              ),

            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(

                child: Image.asset('assets/images/onboarding1.png'),
                height: 400,
                width: MediaQuery.of(context).size.width-26,
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(

                child: Image.asset('assets/images/onboarding3.png'),
                height: 400,
                width: MediaQuery.of(context).size.width-26,
              ),
             CustomButton(
                 'Get Started',
                     (){ Navigator.push(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));},
                 MediaQuery.of(context).size.width-26,
                 40,
                 16,
                 textColor: Colors.white,

                 borderRadius: 5,
             )
            ],
          ),
        ),

      ],
    );
  }
}
