import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minder/consts/colors.dart';
import 'package:minder/ui/widgets/custom_button.dart';
import 'package:minder/ui/widgets/custom_text_field.dart';
class DoctorLogin extends StatefulWidget {
  const DoctorLogin({Key? key}) : super(key: key);

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}

class _DoctorLoginState extends State<DoctorLogin> {
  bool obsecure=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: -20,
        backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset('assets/images/shake_hand.png'),
        const SizedBox(height: 20,),
         const Text('Welcome back',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          const Padding(
           padding:  EdgeInsets.symmetric(horizontal: 40,vertical: 10
           ),
           child:  Text('You can login with your email or username'
             ' also you can use social media.',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color.fromRGBO(123, 122, 122, 1)),),
         ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: CustomTextField(hint: 'Email',prefixIconWidget:const Icon(Icons.email),),
           ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16),
             child: CustomTextField(
               iconWidget:const Icon(Icons.visibility),
               iconPressed: (){
                 setState(() {
                  const Icon(Icons.visibility_off);
                   obsecure=!obsecure;
                 });
               },
               hint: 'Password',
               obscure: obsecure,

               prefixIconWidget:const Icon(Icons.lock),),

           ),
          Row(

            mainAxisAlignment: MainAxisAlignment.end,

            children: [

               Padding(
                 padding:const EdgeInsets.only(right: 9,),
                 child: TextButton(onPressed: (){}, child:const Text('Forget Password ?',style: TextStyle(fontSize: 16,color: Color.fromRGBO(56, 56, 56, 1)),),)
               ),
          ],),
          CustomButton(
            width: MediaQuery.of(context).size.width-32,

            height: 66,
            text: 'Log in',
            textSize: 20,
            onPressed: (){}, fontBold: true,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text('New Member ?',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              TextButton(onPressed: (){}, child:const Text('Sign Up',style: TextStyle(fontSize: 15,color: mainColor2,fontWeight: FontWeight.bold),))
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              children: [Expanded(
                child: Card(

                  child: CustomButton(
                    borderRadius: 10,
                    background: const Color.fromRGBO(229, 229, 229, 1) ,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:const  Color.fromRGBO(60, 90, 154, 1) ,),
                    fontBold: false,
                    icon:Image.asset('assets/images/facebook.png',height: 30,),
                    text: 'Facebook',

                  ),
                ),
              ),
                Expanded(
                  child: Card(

                    child: CustomButton(
                      borderRadius: 10,
                      background: const Color.fromRGBO(229, 229, 229, 1) ,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color.fromRGBO(229, 229, 229, 1) ,),
                      fontBold: false,
                      icon: Image.asset('assets/images/google.png',height: 30,),
                      text: ' Google',
                      textColor: Colors.black,
                    ),
                  ),
                ),


              ],),
          )
        ],

        ),
      ),
    );
  }
}
