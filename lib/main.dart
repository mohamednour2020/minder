import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minder/consts/colors.dart';
import 'package:minder/ui/screens/auth_screens/user/chatbot.dart';
import 'package:minder/ui/screens/auth_screens/user/user_login.dart';
import 'package:minder/ui/screens/home_screen.dart';
import 'package:minder/ui/screens/on_boarding.dart';

import 'data/cubit/login_cubit/login_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<UserLoginCubit>(
          create: (BuildContext context) => UserLoginCubit(),
        ),
        // BlocProvider<UserRegisterCubit>(
        //   create: (BuildContext context) => UserRegisterCubit(),
        // ),
        // BlocProvider<UserHomeCubit>(
        //   create: (BuildContext context) => UserHomeCubit(),
        // ),
        // BlocProvider<UserOrderCubit>(
        //   create: (BuildContext context) => UserOrderCubit(),
        // ),
        // BlocProvider<UserProfileCubit>(
        //   create: (BuildContext context) => UserProfileCubit(),
        // ),
        // BlocProvider<UserCreateOrderCubit>(
        //   create: (BuildContext context) => UserCreateOrderCubit(),
        // ),
        // BlocProvider<ObserverLoginCubit>(
        //   create: (BuildContext context) => ObserverLoginCubit(),
        // ),
        // BlocProvider<ObserverHomeCubit>(
        //   create: (BuildContext context) => ObserverHomeCubit(),
        // ),
        // BlocProvider<ObserverOrderDetailsCubit>(
        //   create: (BuildContext context) => ObserverOrderDetailsCubit(),
        // ),
        // BlocProvider<SettingsCubit>(
        //   create: (BuildContext context) => SettingsCubit(),
        // ),
        // BlocProvider<CreateOrderCubit>(
        //   create: (BuildContext context) => CreateOrderCubit(),
        // ),
        // BlocProvider<LoginCubit>(
        //   create: (BuildContext context) => LoginCubit(),
        // ),
        // BlocProvider<ProfileCubit>(
        //   create: (BuildContext context) => ProfileCubit(),
        // ),
      ],
      child:  MyApp()
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
      ),
      home: AnimatedSplashScreen(
        splashIconSize: 200,
        duration: 2000,
        splash: Image.asset('assets/images/1.png'),
        nextScreen: UserLogin(),
        animationDuration: Duration(seconds:2),
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.rotationTransition,
      ),
    );
  }
}

