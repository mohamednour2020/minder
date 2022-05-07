import 'package:flutter/material.dart';
import 'package:minder/consts/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../pass_change_done.dart';
import 'check_your_mail_for_doctor.dart';
class ResetPassForDoctor extends StatefulWidget {
  const ResetPassForDoctor({Key? key}) : super(key: key);

  @override
  State<ResetPassForDoctor> createState() => _ResetPassForDoctorState();
}

class _ResetPassForDoctorState extends State<ResetPassForDoctor> {
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

              const  Text('Step 3',style: TextStyle(fontSize: 24,color: Colors.white),),
              const  SizedBox(height: 16,),
              const LinearProgressIndicator(

                minHeight: 6
                ,
                color: Color.fromRGBO(255, 219, 68, 1),
                value: 1,
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
                          const Text('Reset Password',style: TextStyle(fontSize: 24),),
                          const SizedBox(height: 8,),
                          const  Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 30),
                            child: Text('Feel free to write your new password and try'
                                'to save it on your note.',style: TextStyle(fontSize: 16,color: Color.fromRGBO(123, 122, 122, 1)),textAlign: TextAlign.center,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextField(height: 53,


                              hint: 'New Password',prefixIconWidget:const Icon(Icons.lock),),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomTextField(height: 53,


                              hint: 'Confirm Password',prefixIconWidget:const Icon(Icons.lock),),
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
                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>ChangePassDone()));
                              }, fontBold: true,
                            ),
                          ),


                        ],),
                    ),
                    Positioned(top: 0,left: 5,
                        child: Image.asset('assets/images/doctorset.png',height: 80,))
                  ],),
              ),
              Center(child: Container(height: 25,width: MediaQuery.of(context).size.width-80,decoration: BoxDecoration(color: Color.fromRGBO(227, 233, 251,0.5),borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),))

            ],),
        ),
      ),
    );
  }
}
