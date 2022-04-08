import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:minder/consts/colors.dart';
import 'package:minder/ui/widgets/custom_app_bar.dart';

import 'auth_screens/doctor_login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,),
    body: Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          RichText(
            textAlign: TextAlign.start,
            text:const TextSpan(
              text: 'How do you want your ',
              style: TextStyle(fontSize: 24,color: Colors.black),
              children:  <TextSpan>[


                TextSpan(text: 'space ?', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
              ],
            ),
          ),
        const SizedBox(height: 8,),
         const Text(
              'To start your journey you have to '
          'click if you are Minders’s friend or Psychiatrist. ',textAlign: TextAlign.start,style: TextStyle(color: Colors.grey),),
         const SizedBox(height: 24,),
          Card(
            color:const Color.fromRGBO(255, 216, 221, 1),
            elevation: 2.5,
            child: Container(
              height: 158,
              child: Row(
                children:
                [
                    Expanded(
                      flex:3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16,left: 10),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,

                            children:const [
                              Text('Minder\'s Friend',style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
                              SizedBox(height: 8,),
                              Text('Being a friend is the meaning '
                                'of learning and talking with minder'
                               ' chatbot and doctors.',style: TextStyle(color: Color.fromRGBO(56, 56, 56, 1)),),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 2,
                        child: Column(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Image.asset('assets/images/fork1.png',height: 100,)
                          ],

                        )),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((10))),
          ),
         const SizedBox(height: 20,),
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>DoctorLogin()));
          },
            child: Card(
              color:const Color.fromRGBO(223, 219, 242, 1),
              elevation: 2.5,
              child: Container(
                height: 158,
                child: Row(
                  children:
                  [
                      Expanded(
                        flex:3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16,left: 10),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,

                              children:const [
                                Text('Psychiatrist',style: TextStyle(fontSize: 20),textAlign: TextAlign.start,),
                                SizedBox(height: 8,),
                                Text('For helping patient to get'
                                 ' better with providing group'
                                 ' & private therapy sessions.',style: TextStyle(color: Color.fromRGBO(56, 56, 56, 1)),),
                              ],
                            ),
                          )),
                      Expanded(
                        flex: 2,
                          child: Column(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                          Image.asset('assets/images/fork2.png',height: 80,)
                            ],

                          )),
                  ],
                ),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular((10))),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
