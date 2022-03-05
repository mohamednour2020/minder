// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:saber/utils/app_colors.dart';
// class CustomDropDown extends StatefulWidget {
//   double? width;
//   double? height;
//   String? headLine;
//   String? dropDownHint;
//   List<String> items;
//   CustomDropDown({Key? key,this.width,this.height,this.headLine="",this.dropDownHint,this.items=const ['يرجي اختيار فئة الوحدة']}) : super(key: key);
//
//   @override
//   State<CustomDropDown> createState() => _CustomDropDownState();
// }
//
// class _CustomDropDownState extends State<CustomDropDown> {
//   String? selectedValue;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     //selectedValue=widget.items.first;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: widget.width??double.infinity,
//       height: 77,
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 widget.headLine??"",
//                 style: const TextStyle(
//                   fontSize:14,
//                   color: black,
//                   fontFamily: "DIN-DEMI",
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8,),
//           Container(
//             width: widget.width??double.infinity,
//             height: widget.height ?? 48,
//             decoration: BoxDecoration(
//               border: Border.all(width: 1.5,color: greyBorder),
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton2(
//                 isExpanded: true,
//                 hint: Row(
//                   children:  [
//                     const SizedBox(
//                       width: 4,
//                     ),
//                     Expanded(
//                       child: Text(
//                         widget.dropDownHint!,
//                         style:const TextStyle(
//                           fontSize: 12,
//                           color: hintTextColor,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 items: widget.items
//                     .map((item) => DropdownMenuItem<String>(
//                   value: item,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       item,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: black,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ))
//                     .toList(),
//                 value: selectedValue,
//                 onChanged: (value) {
//                   setState(() {
//                     selectedValue = value as String;
//                   });
//                 },
//                 icon: const Icon(
//                   Icons.keyboard_arrow_down_rounded,
//                 ),
//                 iconSize: 24,
//                 alignment: Alignment.centerRight,
//                 iconEnabledColor: hintTextColor,
//                 buttonHeight: 48,
//                 buttonWidth: 500,
//                 buttonPadding: const EdgeInsets.only(left: 14, right: 14),
//                 buttonDecoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//                 buttonElevation: 0,
//                 itemHeight: 47,
//                 itemPadding: const EdgeInsets.only(left: 14, right: 14),
//                 dropdownMaxHeight: 200,
//                 dropdownWidth: MediaQuery.of(context).size.width-32,
//                 dropdownPadding: const EdgeInsets.only(left: 14, right: 14),
//                 dropdownDecoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(0),
//                   color: Colors.white,
//                 ),
//                 dropdownElevation: 8,
//                 scrollbarRadius: const Radius.circular(40),
//                 scrollbarThickness: 6,
//                 scrollbarAlwaysShow: true,
//                 offset: const Offset(0, 0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
