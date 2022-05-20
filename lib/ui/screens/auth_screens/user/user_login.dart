import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minder/data/cubit/login_cubit/login_cubit.dart';
import 'package:minder/ui/screens/auth_screens/user/chatbot.dart';
import 'package:minder/ui/screens/auth_screens/user/user_signup_screen.dart';
import 'package:minder/ui/widgets/custom_alert_dialog.dart';
import '../../../../consts/colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import 'forget_pass_user.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  bool obsecure = true;
  var userName = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: -20,
        backgroundColor: Colors.white,
      ),
      body: BlocConsumer<UserLoginCubit, UserLoginState>(
  listener: (context, state) {
    state is LoginError?globalAlertDialogue(context,msg: state.error):
    state is LoginUserSignedIn?Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>Chat()), (route) => false):null;
  },
  builder: (context, state) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/shake_hand.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome back',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                'You can login with your username so '
                ' feel free to write it.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(123, 122, 122, 1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: userName,
                height: 53,
                hint: 'Username',
                prefixIconWidget: const Icon(Icons.person),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: password,
                height: 53,
                iconWidget: const Icon(Icons.visibility),
                iconPressed: () {
                  setState(() {
                    const Icon(Icons.visibility_off);
                    obsecure = !obsecure;
                  });
                },
                hint: 'Password',
                obscure: obsecure,
                prefixIconWidget: const Icon(Icons.lock),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      right: 9,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => ForgetPassUser()));
                      },
                      child: const Text(
                        'Forget Password ?',
                        style: TextStyle(
                            fontSize: 16, color: Color.fromRGBO(56, 56, 56, 1)),
                      ),
                    )),
              ],
            ),
            CustomButton(
              loading:state is LoginLoading,
              width: MediaQuery.of(context).size.width - 32,
              height: 56,
              text: 'Log in',
              textSize: 20,
              onPressed: () {
                UserLoginCubit.get(context).userLogin
                  (userName: userName.text, password: password.text);
              },
              fontBold: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New Member ?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const UserSignup()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 15,
                          color: mainColor2,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
      );
  },
),
    );
  }
}
