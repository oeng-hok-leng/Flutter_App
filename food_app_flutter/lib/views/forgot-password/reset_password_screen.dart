import 'package:flutter/material.dart';
import 'package:food_app_flutter/views/verify-code/verification_password.dart';
import 'package:get/get.dart';

import 'package:food_app_flutter/constants.dart';
import 'package:food_app_flutter/views/change-password/change_password.dart';
import 'package:food_app_flutter/views/login/login_screen.dart';
import 'package:food_app_flutter/widgets/mybutton.dart';
import 'package:food_app_flutter/widgets/text_input_widget.dart';
import 'package:food_app_flutter/widgets/text_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String emailHixtText =
      "Please provide your email to reset your password. please don't share any data to other people";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.only(left: 20.0, right: 20.0, top: size.height * .15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyText(
                text: "Forgot \nPassword?",
                isBold: true,
                size: 28,
              ),
              SizedBox(height: size.height * 0.1),
              Form(
                key: _formKey,
                child: TextInputWidget(
                  controller: emailController,
                  lable: "EMAIL",
                  hintext: "foodapp@exampl.com",
                  icon: Icons.email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: MyText(
                  text: emailHixtText,
                  size: 14,
                  color: Constants.subTextColor,
                ),
              ),
              const SizedBox(height: 20),
              _allResetButton(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 40,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 30),
        child: TextButton(
          onPressed: () {},
          child: const MyText(
            text: "Need Help?",
            isBold: true,
          ),
        ),
      ),
    );
  }

  _onReset() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Get.to(
      () => const VerifyPassword(),
      duration: const Duration(milliseconds: 400),
      transition: Transition.fadeIn,
    );
  }

  Column _allResetButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyButton(
          child: const MyText(
            text: "Reset Now",
            isBold: true,
            size: 14,
          ),
          onTap: () {
            _onReset();
            print("is it tapped...");
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyText(
              text: "Remember now?",
            ),
            TextButton(
              child: const MyText(
                text: "Login Here",
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
        ),
      ],
    );
  }
}
