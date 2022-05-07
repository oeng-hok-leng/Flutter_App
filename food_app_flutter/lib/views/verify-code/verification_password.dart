import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app_flutter/constants.dart';
import 'package:food_app_flutter/views/change-password/change_password.dart';
import 'package:food_app_flutter/widgets/mybutton.dart';
import 'package:food_app_flutter/widgets/text_widget.dart';
import 'package:get/get.dart';

class VerifyPassword extends StatefulWidget {
  const VerifyPassword({Key? key}) : super(key: key);

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var isCorrectForm = true;

  int maxTimer = 60;
  var isResendTap = false;
  Timer? timer;

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
                text: "Code\nVerificaiton",
                isBold: true,
                size: 28,
              ),
              SizedBox(height: size.height * 0.2),
              Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _verifyInput(first: true, last: false),
                            _verifyInput(first: false, last: false),
                            _verifyInput(first: false, last: false),
                            _verifyInput(first: false, last: true),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!isCorrectForm)
                    const MyText(
                      text: "Your code is not valid. please input valide code ",
                      size: 14,
                      color: Constants.invalidColor,
                    ),
                ],
              ),
              const SizedBox(height: 30),
              _allResetButton(),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 30,
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

  _onVerify() {
    if (!_formKey.currentState!.validate()) {
      setState(() {
        isCorrectForm = false;
      });
      return;
    } else {
      setState(() {
        isCorrectForm = true;
      });
      Get.to(
        () => const ChangePasswordScreen(),
        duration: const Duration(milliseconds: 400),
        transition: Transition.fadeIn,
      );
    }
  }

  Container _verifyInput({bool first = false, last = false}) {
    return Container(
      height: 60,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: isCorrectForm ? Colors.grey : Constants.invalidColor,
              width: 2),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextFormField(
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) {
              return "";
            }
            return null;
          },
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            } else if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: isCorrectForm ? Colors.black : Constants.invalidColor),
          readOnly: false,
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
        ),
      ),
    );
  }

  onResend() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (maxTimer > 0) {
          maxTimer--;
        } else {
          isResendTap = false;
          timer!.cancel();
          maxTimer = 60;
        }
      });
    });
  }

  Column _allResetButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyButton(
          child: const MyText(
            text: "Verification",
            isBold: true,
            size: 14,
          ),
          onTap: () {
            _onVerify();
          },
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const MyText(
              text: "Didn't received the code?",
            ),
            TextButton(
              child: MyText(
                text: "Resend ($maxTimer)",
                isBold: true,
                color: isResendTap ? Colors.grey : Colors.black87,
              ),
              onPressed: isResendTap
                  ? null
                  : () {
                      setState(() {
                        isResendTap = !isResendTap;
                      });
                      onResend();
                    },
            ),
          ],
        ),
      ],
    );
  }
}
