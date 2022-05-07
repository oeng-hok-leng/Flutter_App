import 'package:flutter/material.dart';
import 'package:food_app_flutter/constants.dart';
import 'package:food_app_flutter/widgets/text_widget.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.2, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyText(
                text: "Password\nchanged!",
                isBold: true,
                size: 28,
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.08),
                height: size.height * 0.2,
                width: size.width * 0.5,
                child: Image.asset(
                  'assets/images/lock.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 80,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Constants.orangeDarker,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: MyText(
              text: "Get Started",
              isBold: true,
            ),
          ),
        ),
      ),
    );
  }
}
