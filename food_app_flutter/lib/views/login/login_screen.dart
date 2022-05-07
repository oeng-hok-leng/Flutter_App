import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:food_app_flutter/views/forgot-password/reset_password_screen.dart';
import 'package:food_app_flutter/views/register/register_screen.dart';
import 'package:food_app_flutter/widgets/mybutton.dart';
import 'package:food_app_flutter/widgets/password_input_widget.dart';
import 'package:food_app_flutter/widgets/text_input_widget.dart';
import 'package:food_app_flutter/widgets/text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .15, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText(
                text: "Login to \nfind the Best Food ",
                isBold: true,
                size: 28,
              ),
              SizedBox(height: size.height * 0.15),
              _formFieldSignIn(),
              _allSignInButton()
            ],
          ),
        ),
      ),
    );
  }

  _onSignIn() {
    if (!formKey.currentState!.validate()) {
      return;
    }
  }

  Form _formFieldSignIn() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextInputWidget(
            controller: emailController,
            lable: "EMAIL",
            hintext: "foodapp@example.com",
            icon: Icons.email_outlined,
          ),
          const SizedBox(height: 18),
          PasswordInputWidget(
            controller: passwordController,
            label: "Password",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: TextButton(
              onPressed: () {
                Get.to(
                  () => const ResetPassword(),
                  duration: const Duration(milliseconds: 400),
                  transition: Transition.fadeIn,
                );
              },
              child: const MyText(
                text: "Forgot Password?",
                size: 12,
                isBold: true,
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _allSignInButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyButton(
          child: const MyText(
            text: "Sign In ",
            isBold: true,
            size: 14,
          ),
          onTap: _onSignIn,
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
              text: "Don't have an account? ",
            ),
            TextButton(
              child: const MyText(
                text: "Register",
                isBold: true,
              ),
              onPressed: () {
                Get.to(
                  () => const RegisterScreen(),
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
