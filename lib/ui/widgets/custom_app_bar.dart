

import 'package:flutter/material.dart';

import '../../consts/colors.dart';


PreferredSize customAppbar(BuildContext context,{ String? title, bool leading=false}){
  return PreferredSize(
    preferredSize: const Size(double.infinity,56),
    child: AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: mainColor,
      title: Text(
        title??"",
        style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: "DIN-DEMI"
        ),
      ),
      leading: !leading
          ?
      const SizedBox()
          :
      IconButton(
        icon: const Icon(Icons.arrow_back,size: 28,color: Colors.white,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    )
  );
}

