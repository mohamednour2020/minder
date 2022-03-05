import 'package:flutter/material.dart';

class DubiSignLogo extends StatelessWidget {
  double? width;
  double? height;
  DubiSignLogo({Key? key,this.height,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/dubi_logo.png",width: 118,height: 40,);
  }
}
