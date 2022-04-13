import 'package:flutter/material.dart';
import 'package:minder/ui/screens/auth_screens/user_signup_screen.dart';

import '../../../consts/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'doctor_signup_screen.dart';
class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
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
            child:  Text('You can login with your username so '
             ' feel free to write it.'
               ,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color.fromRGBO(123, 122, 122, 1)),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(height: 53,

              hint: 'Username',prefixIconWidget:const Icon(Icons.person),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(
              height: 53,
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

            height: 56,
            text: 'Log in',
            textSize: 20,
            onPressed: (){}, fontBold: true,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('New Member ?',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>const UserSignup()));
              }, child:const Text('Sign Up',style: TextStyle(fontSize: 15,color: mainColor2,fontWeight: FontWeight.bold),))
            ],
          ),

        ],

        ),
      ),
    );
  }
}
