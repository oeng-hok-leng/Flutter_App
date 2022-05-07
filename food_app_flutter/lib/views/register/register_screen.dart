import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_flutter/views/login/login_screen.dart';
import 'package:food_app_flutter/widgets/mybutton.dart';
import 'package:food_app_flutter/widgets/password_input_widget.dart';
import 'package:food_app_flutter/widgets/text_input_widget.dart';
import 'package:food_app_flutter/widgets/text_widget.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: size.height * .15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText(
                text: "Register \nNew account ",
                isBold: true,
                size: 28,
              ),
              SizedBox(height: size.height * 0.1),
              _registerForm(),
              const SizedBox(height: 16),
              _allSignUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  _onSignup() {
    if (!_formkey.currentState!.validate()) {
      return;
    }
  }

  Form _registerForm() {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInputWidget(
            controller: usernameController,
            lable: "FULL NAME",
            hintext: 'Food App',
            icon: Icons.perm_identity,
          ),
          const SizedBox(height: 18),
          TextInputWidget(
              controller: emialController,
              lable: "EMAIL",
              hintext: 'foodapp@example.com',
              icon: Icons.email_outlined),
          const SizedBox(height: 18),
          TextInputWidget(
            controller: usernameController,
            lable: "PHONE",
            hintext: '012-456-789',
            icon: Icons.phone_android,
          ),
          const SizedBox(height: 18),
          PasswordInputWidget(
            label: "PASSWORD",
            controller: passwordController,
          )
        ],
      ),
    );
  }

  Column _allSignUpButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyButton(
          child: const MyText(
            text: "Register",
            isBold: true,
            size: 14,
          ),
          onTap: _onSignup,
        ),
        const SizedBox(height: 10),
        MyButton(
          isHaveBorder: true,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/facebook.svg'),
              const SizedBox(width: 10),
              const MyText(
                text: "Sign up with Facebook",
                isBold: true,
                size: 14,
              ),
            ],
          ),
          onTap: () {},
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyText(
              text: "Already have an account?",
            ),
            TextButton(
              child: const MyText(
                text: "Login",
                isBold: true,
              ),
              onPressed: () {
                Get.to(
                  () => const LoginScreen(),
                  duration: const Duration(milliseconds: 400),
                  transition: Transition.fadeIn,
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
