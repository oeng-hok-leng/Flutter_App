import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BrandShowWidget extends StatelessWidget {
  BrandShowWidget({Key? key}) : super(key: key);

  var brandImg = [
    "AKG_logo.png",
    "beats-logo.png",
    "JBL-logo.png",
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: size.height * 0.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 20, bottom: 30, right: 10),
              height: size.height * 0.1,
              width: size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                // "assets/AKG_logo.png",
                "assets/${brandImg[index]}",
                height: 90,
                width: 90,
              ),
            );
          },
        ),
      ),
    );
  }
}
