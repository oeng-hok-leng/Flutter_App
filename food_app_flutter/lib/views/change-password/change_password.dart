import 'package:flutter/material.dart';
import 'package:food_app_flutter/constants.dart';
import 'package:food_app_flutter/views/change-password/password_changed.dart';
import 'package:food_app_flutter/widgets/mybutton.dart';
import 'package:food_app_flutter/widgets/password_input_widget.dart';
import 'package:food_app_flutter/widgets/text_widget.dart';

import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String emailHixtText =
      "Please provide your email to reset your password. please don't share any data to other people";

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
                text: "Change\nNew Password",
                isBold: true,
                size: 28,
              ),
              SizedBox(height: size.height * 0.1),
              _formChangePassword(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: MyText(
                  text: emailHixtText,
                  size: 14,
                  color: Constants.subTextColor,
                ),
              ),
              const SizedBox(height: 20),
              MyButton(
                child: const MyText(
                  text: "Change Password",
                  isBold: true,
                  size: 14,
                ),
                onTap: _onChangePassword
                // Get.to(
                //   () => const PasswordChanged(),
                //   duration: const Duration(milliseconds: 400),
                //   transition: Transition.fadeIn,
                // );
                ,
              ),
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

  _onChangePassword() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    Get.to(
      () => const PasswordChanged(),
      duration: const Duration(milliseconds: 400),
      transition: Transition.fadeIn,
    );
  }

  Form _formChangePassword() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PasswordInputWidget(
            controller: oldPasswordController,
            label: "OLD PASSWORD",
            isLoginPage: false,
          ),
          const SizedBox(height: 20),
          PasswordInputWidget(
            controller: newPasswordController,
            label: "New PASSWORD",
            isLoginPage: false,
          ),
        ],
      ),
    );
  }
}
