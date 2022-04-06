library easy_onboarding;

import 'package:flutter/material.dart';
import 'package:minder/ui/screens/home_screen.dart';

class EasyOnboarding extends StatefulWidget {
  final Color backgroundColor;
  final Color bottomBackgroundColor;
  final Color indicatorSelectedColor;
  final Color indicatorUnselectedColor;
  final Color startButtonColor;
  final Color backButtonColor;
  final Icon? backButtonIcon;
  final Color nextButtonColor;
  final Icon ?nextButtonIcon;
  final Function ?onStart;
  final Text startButtonText;
  final List<Widget>? children;
  final Color? skipButtonColor;
  final Text skipButtonText;

  EasyOnboarding({
    this.backgroundColor = Colors.white,
    this.bottomBackgroundColor = Colors.white,
    this.indicatorSelectedColor = Colors.red,
    this.indicatorUnselectedColor = Colors.grey,
    this.startButtonColor = Colors.red,
    required this.startButtonText,
    this.backButtonColor = Colors.red,
    this.backButtonIcon,
    this.nextButtonColor = Colors.red,
     this.nextButtonIcon,
     this.onStart,
  this.children,
    this.skipButtonColor,
    required this.skipButtonText,
  });
  @override
  _EasyOnboardingState createState() => _EasyOnboardingState();
}

class _EasyOnboardingState extends State<EasyOnboarding> {
  final PageController _pageController = PageController(initialPage: 0);

  Widget pageIndexIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 60.0),
      height: isCurrentPage ? 30.0 : 10.0,
      width: isCurrentPage ? 15.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage
            ? widget.indicatorSelectedColor
            : widget.indicatorUnselectedColor,
        shape: BoxShape.circle,
      ),
    );
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: widget.backgroundColor,
          actions: _currentIndex == widget.children!.length - 1
              ? null
              : [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: widget.skipButtonColor,
                onPressed: () {
                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>HomeScreen()), (route) => false);
                },
                child: widget.skipButtonText,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: widget.children!,
              onPageChanged: (val) {
                setState(() {
                  _currentIndex = val;
                });

                print(_currentIndex);
              },
            ),
            Positioned(
              bottom: 100,
              // left: 150,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < widget.children!.length; i++)
                      _currentIndex == i
                          ? pageIndexIndicator(true)
                          : pageIndexIndicator(false)
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
