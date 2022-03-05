import 'package:flutter/material.dart';
class CustomLogo extends StatelessWidget {
  double? width;
  double? height;
  bool? saber;
  bool? saberAndEvaluation;
  CustomLogo({Key? key,this.height,this.width,this.saber=false,this.saberAndEvaluation=false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      saber!
          ?
      Image.asset("assets/images/logo_saber.png",width: width??82,height: height??140,)
          :
      saberAndEvaluation!
          ?
      Image.asset("assets/images/logo_saber_evaluation.png",width: width??132,height: height??175,)
          :
      Image.asset("assets/images/logo.png",width: width??80,height: height??80,);
  }
}
