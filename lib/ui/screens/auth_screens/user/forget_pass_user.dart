import 'package:flutter/material.dart';
import 'package:minder/ui/screens/auth_screens/user/security_question_user.dart';

import '../../../../consts/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../doctor/check_your_mail_for_doctor.dart';
class ForgetPassUser extends StatefulWidget {
  const ForgetPassUser({Key? key}) : super(key: key);

  @override
  State<ForgetPassUser> createState() => _ForgetPassUserState();
}

class _ForgetPassUserState extends State<ForgetPassUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: mainColor2,
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.black),
        backgroundColor: mainColor2,elevation: 0,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const  Text('Step 1',style: TextStyle(fontSize: 24,color: Colors.white),),
              const  SizedBox(height: 16,),
              const LinearProgressIndicator(

                minHeight: 6
                ,
                color: Color.fromRGBO(255, 219, 68, 1),
                value: 0.3,
              ),
              const SizedBox(height: 16,),
              Container(height:500 ,
                width: double.infinity,
                decoration: BoxDecoration(color: mainColor2,borderRadius: BorderRadius.circular(20)),
                child: Stack(alignment: Alignment.bottomCenter,
                  children: [
                    Container(height: 450,width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Security Question',style: TextStyle(fontSize: 24),),
                          const SizedBox(height: 8,),
                          const  Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 30),
                            child: Text('Fill the data below so that we can help you'
                            'for reset your password.',style: TextStyle(fontSize: 16,color: Color.fromRGBO(123, 122, 122, 1)),textAlign: TextAlign.center,),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextField(height: 53,


                              hint: 'Username',prefixIconWidget:const Icon(Icons.person),),
                          ),
                         const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomButton(
                              width: MediaQuery.of(context).size.width-32,
                              height: 53,
                              text: 'Continue',
                              textSize: 20,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>const SequerityQuestion()));
                              }, fontBold: true,
                            ),
                          ),


                        ],),
                    ),
                    Positioned(top: 0,left: 5,
                        child: Image.asset('assets/images/doctorset.png',height: 80,))
                  ],),
              ),
              Center(child: Container(height: 25,width: MediaQuery.of(context).size.width-80,decoration:const BoxDecoration(color: Color.fromRGBO(227, 233, 251,0.5),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),))

            ],),
        ),
      ),
    );
  }
}
