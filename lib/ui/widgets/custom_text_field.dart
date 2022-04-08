import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  double? width;
  double? height;
  late bool obscure;
  String? label;
  TextStyle? hintStyle;
  String? headLine;
  IconData? icon;
  Widget? iconWidget;
  Widget? prefixIconWidget;
  Color? labelColor;
  TextInputType? textType;
  Function(String val)? onChange;
  Function()? iconPressed;
  Function()? onPressed;
  bool? enabled;
  FocusNode? focusNode;
  int? maxLines;
  int? minLines;
  CustomTextField(
      {this.controller,
        this.hint = "",
        this.width,
        this.prefixIconWidget,
        this.height,
        this.obscure = false,
        this.label,
        this.hintStyle,
        this.icon,
        this.iconWidget,
        this.enabled = true,
        this.labelColor,
        this.textType,
        this.onPressed,
        this.focusNode,
        this.maxLines,
        this.minLines,
        this.headLine,
        this.iconPressed,
        this.onChange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child:  SizedBox(
        width: width??double.infinity,
        height: 77,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  headLine??"",
                  style: const TextStyle(
                    fontSize:14,
                    color: black,
                    fontFamily: "DIN-DEMI",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8,),
            Container(
              height: height ?? 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                minLines: minLines??1,
                maxLines: maxLines??1,
                enabled: enabled,
                keyboardType: textType ?? TextInputType.text,
                controller: controller,
                focusNode: focusNode,
                onChanged: onChange,
                obscureText: obscure,
                decoration: InputDecoration(
                  labelText:hint??'' ,
                    hintText: hint ?? "",
                    hintStyle:hintStyle?? const TextStyle(fontSize: 12, color: Colors.grey,),
                    // labelText: label,
                    // labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                    contentPadding: const EdgeInsets.only(top: 8,right: 8,left: 8),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: mainColor),
                    ),
                    prefixIcon: prefixIconWidget??null,
                    suffixIcon: iconWidget == null
                        ? (icon == null
                        ? null
                        : InkWell(
                        onTap: iconPressed ?? () {},
                        child: Icon(
                          icon,
                          size: 18,
                          color: mainColor,
                        )))
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        iconWidget!,
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}