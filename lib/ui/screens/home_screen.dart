import 'package:flutter/material.dart';
import 'package:minder/ui/widgets/custom_app_bar.dart';
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
    body: Column(
      children:
      [
        RichText(
          text:const TextSpan(
            text: 'How do you want your ',
            style: TextStyle(fontSize: 24,color: Colors.black),
            children:  <TextSpan>[


              TextSpan(text: 'space ?', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
            ],
          ),
        ),
        Text(
            'To start your journey you have to '
        'click if you are Minders’s friend or Psychiatrist. ',textAlign: TextAlign.start,)
      ],
    ),
    );
  }
}
