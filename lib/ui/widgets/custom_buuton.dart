import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  String text ;
  Function onPressed ;
  double width ;
  double height ;
  double textSize = 16;
  BoxDecoration decoration;
  Color textColor ;
  Color background ;
  Border border ;
  Widget icon ;
  double borderRadius=5;
  BorderRadius borderRadiusObject ;



  @override
  Widget build(BuildContext context) {
    return  Container(
          width: width ?? MediaQuery.of(context).size.width * 0.8 ,
          height: height ?? 48,
          decoration: decoration ?? BoxDecoration(
              color: background ?? const Color(0xffF5F5F5),
              borderRadius:borderRadiusObject ??BorderRadius.circular(borderRadius ?? 0),
              border:  border
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon??Container(),
              icon!= null && (text?.isNotEmpty??false) ? const SizedBox(width: 6,) : Container(),
              Text(text??"" , style: TextStyle(
                color: textColor??Colors.black ,
                fontSize: textSize ,
                fontWeight: FontWeight.bold,
              ),maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )

    );
  }

  CustomButton(

      this.text,
      this.onPressed,
      this.width,
      this.height,
      this.textSize,
      this.borderRadius,
      {required this.decoration,
  required this.textColor,
  required this.background,
  required this.border,
  required this.icon,

  required this.borderRadiusObject}
      );
}