import 'dart:math';

import 'package:flutter/material.dart';

class SwapButton extends StatefulWidget {
  const SwapButton({Key? key}) : super(key: key);

  @override
  _SwapButtonState createState() => _SwapButtonState();
}

class _SwapButtonState extends State<SwapButton> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _left = 10.0;

    return SizedBox(
      height: 50,
      width: size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: _left,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print("TAPPed");
                },
                onPanUpdate: (details) {
                  _left = max(0, _left + details.delta.dx);
                  setState(() {});
                  print("right position: $_left");
                },
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 7, 4, 4),
                  child: Icon(Icons.arrow_forward_ios, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
