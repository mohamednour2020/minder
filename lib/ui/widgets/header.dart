import 'package:flutter/material.dart';


import '../../consts/colors.dart';
class Header extends StatefulWidget {
  String? title;
  double? textSize;
  double? height;
   Header({Key? key,this.title,this.textSize,this.height}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 27,vertical: 10),
      width: double.infinity,
      color: mainColor.withOpacity(0.2),
      child: Center(child: Text(
        widget.title??'يرجى دفع 200 ريال قيمة التقييم',
        style:TextStyle(
          fontSize: widget.textSize??18,
          color: mainColor,
          fontFamily: "DIN-MEDIUM",
        ),
        textAlign: TextAlign.center,),
      ),
    );
  }
}
