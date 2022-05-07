import 'package:flutter/material.dart';

import '../../../consts/colors.dart';
import '../../widgets/custom_button.dart';
class ChangePassDone extends StatefulWidget {
  const ChangePassDone({Key? key}) : super(key: key);

  @override
  State<ChangePassDone> createState() => _ChangePassDoneState();
}

class _ChangePassDoneState extends State<ChangePassDone> {
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
                          Image.asset('assets/images/done.png',height: 215,width: 222,),
                          const SizedBox(height: 40,),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text('Your password has been changed successfully!',
                              style: TextStyle(fontSize: 22),textAlign: TextAlign.center,),
                          ),


                          const SizedBox(height: 20,),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomButton(
                              width: MediaQuery.of(context).size.width-32,
                              height: 53,
                              text: 'Ok',
                              textSize: 20,
                              onPressed: (){
                              //  Navigator.push(context, MaterialPageRoute(builder: (builder)=>const UserNewPassword()));
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
