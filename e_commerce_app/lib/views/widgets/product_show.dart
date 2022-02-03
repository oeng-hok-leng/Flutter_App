import 'dart:math';

import 'package:e_commerce_app/constants/palette.dart';
import 'package:e_commerce_app/views/detail_product_view.dart';
import 'package:e_commerce_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductShow extends StatefulWidget {
  ProductShow({Key? key}) : super(key: key);

  @override
  State<ProductShow> createState() => _ProductShowState();
}

class _ProductShowState extends State<ProductShow> {
  var products = [
    {
      "img": "assets/product-1.png",
      "bgColor": Colors.red.withOpacity(0.2),
    },
    {
      "img": "assets/product-3.png",
      "bgColor": Colors.purple.withOpacity(0.2),
    },
    {
      "img": "assets/product-2.png",
      "bgColor": Colors.pink.withOpacity(0.2),
    },
    {
      "img": "assets/product-4.png",
      "bgColor": Colors.blue.withOpacity(0.2),
    },
  ];
  var _isFav = false;
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GridView.count(
        crossAxisSpacing: 40,
        mainAxisSpacing: 30,
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        children: List.generate(4, (index) {
          // print(products[index].keys);

          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailProductView.routeName,
                  arguments: index);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 400,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _index = index;
                            _isFav = !_isFav;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: _isFav && _index == index
                              ? Colors.red
                              : Colors.grey.withOpacity(0.5),
                          radius: 9,
                          child: const Icon(Icons.favorite,
                              size: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 20,
                          left: 10,
                          child: Transform.rotate(
                            angle: pi / 3.5,
                            child: SvgPicture.asset(
                              "assets/triangle.svg",
                              height: 150,
                              // color: Colors.red.withOpacity(0.4),
                              color: products[index]['bgColor'] as Color,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 20,
                          top: 5,
                          child: Transform.rotate(
                            angle: -pi / 5.5,
                            child: Image.asset(
                              "${products[index]['img']}",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextWidget(text: "Beats Pro"),
                          const TextWidget(
                            text: "\$225.5",
                            size: 10,
                            isBold: true,
                            color: Palettes.splashBgColor,
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              return Icon(
                                  index < 3 ? Icons.star : Icons.star_border,
                                  color: Palettes.starColor,
                                  size: 12);
                            }),
                          )
                        ],
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
