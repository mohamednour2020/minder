import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/date_picker.dart';
class UserSignup extends StatefulWidget {
  const UserSignup({Key? key}) : super(key: key);

  @override
  State<UserSignup> createState() => _UserSignupState();
}

class _UserSignupState extends State<UserSignup> {
  bool obsecure=true;
  bool ismale = true;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var dateController = TextEditingController();
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

          const SizedBox(height: 20,),
          const Text('Create new account',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 40,vertical: 10
            ),
            child:  Text('Feel safe to write all your information'
                'and have a nice day'
              ,textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color.fromRGBO(123, 122, 122, 1)),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(height: 53,

              hint: 'Name',prefixIconWidget:const Icon(CupertinoIcons.person_crop_rectangle_fill),),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextField(height: 53,

              hint: 'Username',prefixIconWidget:const Icon(Icons.person),),
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16),
           child:
             CustomTextField(
               hint: 'Date of birth',
               prefixIconWidget: Icon(Icons.calendar_today),
            onPressed: () {
              showDatePicker(

                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate:DateTime.now(),

              ).then((value) {
                dateController.text =
                '${value!.day} / ${value.month} / ${value.year}';
              });
            },
               height: 53,
               controller: dateController,

             ),

         ),
        const  SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width/2-15,
                    height: 56.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: ismale == true?const Color.fromRGBO(255, 137, 156, 1):Colors.grey ),
                      color: ismale == true
                          ?const Color.fromRGBO(255, 137, 156, 1)
                          :const Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(15.0),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Image.asset( ismale == true?
                          'assets/images/male2.png':'assets/images/female.png',width: 25,height: 25,),
                          const  SizedBox(
                            width: 11,
                          ),
                          Text(
                            'Female',
                            style: TextStyle(
                                color: ismale == true
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ismale = true;
                    });
                  },
                ),
                const  SizedBox(
                  width: 15.0,
                ),
                GestureDetector(
                  child: Container(
                    width:  MediaQuery.of(context).size.width/2-15,
                    height: 56.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: ismale == false?const Color.fromRGBO(34, 67, 112, 1):Colors.grey ),
                      color: ismale == false
                          ?const Color.fromRGBO(34, 67, 112, 1)
                          :const Color.fromRGBO(246, 246, 246, 1),
                      borderRadius: BorderRadius.circular(15.0),


                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset( ismale == true?
                          'assets/images/female2.png':'assets/images/male.png',width: 25,height: 25,),

                          const SizedBox(
                            width: 11,
                          ),
                          Text(
                            'Male',
                            style: TextStyle(
                                color: ismale == false
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      ismale = false;
                    });
                  },
                ),
              ],
            ),
          ),
        const  SizedBox(height: 16,),


          CustomButton(
            width: MediaQuery.of(context).size.width-32,

            height: 56,
            text: 'Sign Up',
            textSize: 20,
            onPressed: (){


              globalAlertDialogue(context,img: 'assets/images/warning.png',msg:'You are under age, as you should be '
                  '> 16 to be able to create an account' );
            }, fontBold: true,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Have an account ?',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child:const Text('Login',style: TextStyle(fontSize: 15,color: mainColor2,fontWeight: FontWeight.bold),))
            ],
          ),


        ],

        ),
      ),
    );
  }
}
