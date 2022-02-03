import 'dart:math';

import 'package:e_commerce_app/constants/palette.dart';
import 'package:e_commerce_app/root_app.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var _left = 5.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palettes.splashBgColor,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: size.height * 0.3,
              bottom: 0,
              right: -150,
              left: 50,
              child: Image.asset(
                "assets/homepage_picture.png",
                color: const Color.fromRGBO(255, 255, 255, 0.5),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 90,
                    width: 200,
                    margin: const EdgeInsets.only(top: 100),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Audiozic_logo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 250,
                    child: Text(
                      "Search for wireless Headphones",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 40, left: 40, right: 40),
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          bottom: 10,
                          right: 50,
                          left: 50,
                          child: Text(
                            (_left >= 65) ? "" : "Welcome to Audiozic",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: 0,
                          bottom: 0,
                          left: _left,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onPanUpdate: (details) {
                              _left = max(0, _left + details.delta.dx);
                              setState(() {});
                              //print("right position: $_left");
                              if (_left >= 300) {
                                Navigator.of(context)
                                    .pushReplacementNamed(RootApp.routeName);
                              }
                            },
                            onPanEnd: (_) {
                              if (_left < 299) {
                                setState(() {
                                  _left = 5;
                                });
                              }
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_forward_ios,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
