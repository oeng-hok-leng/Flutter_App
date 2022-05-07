import 'package:flutter/material.dart';

import 'package:food_app_flutter/constants.dart';
import 'package:food_app_flutter/views/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.orangeDarker,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/appicon.png',
              height: 64,
              width: 64,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              pause: const Duration(milliseconds: 200),
              totalRepeatCount: 1,
              onFinished: () {
                Get.to(
                  () => const LoginScreen(),
                  duration: const Duration(milliseconds: 400),
                  transition: Transition.fadeIn,
                );
              },
              animatedTexts: [
                TyperAnimatedText(
                  "Foodes App",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 200),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
