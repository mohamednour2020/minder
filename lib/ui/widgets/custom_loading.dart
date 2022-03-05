import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class Loading extends StatelessWidget {
  double? height ;
  double? width ;
  bool? isBackground ;


  Loading({Key? key, this.height = 40, this.width = 40 , this.isBackground = true }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: height,
        height: width,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          // color: Color(0xffF5F5F5),
            shape: BoxShape.circle
        ),
        child: CircularProgressIndicator(
          valueColor:  AlwaysStoppedAnimation<Color>(isBackground! ? Colors.white : mainColor),
        ),
      ),
    );
  }
}