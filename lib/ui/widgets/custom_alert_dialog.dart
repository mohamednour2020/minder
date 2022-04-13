import 'package:flutter/material.dart';
import '../../consts/colors.dart';

globalAlertDialogue(BuildContext context,{String? img,String? msg} ) {
  showDialog(

    context: context,
    builder: (BuildContext context) {
      return  AlertDialog(
        shape:const RoundedRectangleBorder(borderRadius:  BorderRadius.all(Radius.circular(20.0))) ,

        title:Center(
          child:img!=null? Image.asset(img,height: 93,

          ):const SizedBox(),
        ),
        content: Text(msg!,style:const TextStyle(fontSize: 16,fontWeight:FontWeight.bold),)
      );
    },
  );
}
