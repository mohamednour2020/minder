import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class RowText extends StatelessWidget {
  String? leading;
  Color? leadingColor;
  double? leadingTextSize;
  String? trailing;
  Color? trailingColor;
  RowText({Key? key,this.leading,this.leadingColor,this.leadingTextSize,this.trailing,this.trailingColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading??"",
          style: TextStyle(
            fontSize: leadingTextSize??16,
            color: leadingColor??black,
            fontFamily: "DIN-MEDIUM",
          ),
        ),
        Text(
          trailing??"",
          style: TextStyle(
            fontSize: 16,
            color: trailingColor??mainColor,
            fontFamily: "DIN-MEDIUM",
          ),
        ),
      ],
    );
  }
}
