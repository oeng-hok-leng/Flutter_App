import 'dart:math';

import 'package:e_commerce_app/constants/palette.dart';
import 'package:e_commerce_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailProductView extends StatefulWidget {
  DetailProductView({Key? key}) : super(key: key);
  static const routeName = '/detail-product';

  @override
  State<DetailProductView> createState() => _DetailProductViewState();
}

class _DetailProductViewState extends State<DetailProductView> {
  var descrip = [
    {
      "Type": "Input Type",
      "description": "3.5mm stereo jack",
    },
    {
      "Type": "Other Features",
      "description":
          "Bluetooth, Foldable, Noise\n, Isolation, Stereo Bluetooth, Wireless"
    },
    {
      "Type": "Form Factor",
      "description": "On-Ear",
    },
    {
      "Type": "Connections",
      "description": "Bluetooth, Wireless",
    },
    {
      "Type": "Speaker Configuration",
      "description": "Stereo",
    },
  ];

  var products = [
    {
      "img": "assets/product-1.png",
      "bgColor": Colors.red,
    },
    {
      "img": "assets/product-3.png",
      "bgColor": Colors.purple,
    },
    {
      "img": "assets/product-2.png",
      "bgColor": Colors.pink,
    },
    {
      "img": "assets/product-4.png",
      "bgColor": Colors.blue,
    },
  ];
  var _curIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _curIndex = ModalRoute.of(context)!.settings.arguments as int;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(context),
      body: Container(
        margin: const EdgeInsets.only(top: 5),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          color: Palettes.primaryBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.01),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Button left
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_curIndex > 0) {
                                _curIndex--;
                              }
                              print("_currindex: $_curIndex");
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            padding: const EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Palettes.splashBgColor.withOpacity(0.2),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                              color: Palettes.splashBgColor,
                            ),
                          ),
                        ),
                        // Image Preview

                        //Image
                        Container(
                          // color: Colors.blue,
                          height: 230,
                          width: size.width * 0.7,
                          child: PageView.builder(
                            itemCount: products.length,
                            itemBuilder: (ctx, index) {
                              return Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    bottom: 20,
                                    left: 50,
                                    right: 0,
                                    child: Transform.rotate(
                                      angle: pi / 3.5,
                                      child: SvgPicture.asset(
                                        "assets/triangle.svg",
                                        height: 30,

                                        color: (products[_curIndex]['bgColor']
                                                as Color)
                                            .withOpacity(0.15),
                                        // color: products[index]['bgColor'] as Color,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 20,
                                    bottom: 20,
                                    top: 10,
                                    child: Transform.rotate(
                                      angle: -pi / 5.5,
                                      child: Image.asset(
                                        products[_curIndex]['img'] as String,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                            onPageChanged: (index) {
                              setState(() {
                                _curIndex = index;
                              });
                            },
                          ),
                        ),

                        // Button Right
                        GestureDetector(
                          onTap: () {
                            print("it is wokring $_curIndex");

                            if (_curIndex < 3) {
                              setState(() {
                                _curIndex++;
                              });
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: 35,
                            padding: const EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Palettes.splashBgColor.withOpacity(0.2),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                              color: Palettes.splashBgColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return Icon(
                              index > 3 ? Icons.star_border : Icons.star,
                              color: Palettes.starColor,
                              size: 14,
                            );
                          }),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: TextWidget(
                            text: "Beats Solo3 Headphones",
                            isBold: true,
                            size: 14,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: TextWidget(
                            text: "\$249.6",
                            isBold: true,
                            size: 14,
                            color: Palettes.splashBgColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.45,
              width: size.width,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: "Colors",
                    isBold: true,
                    size: 16,
                  ),
                  Row(
                    children: List.generate(products.length, (index) {
                      double size = index == _curIndex ? 20 : 10;

                      return Container(
                        height: size,
                        width: size,
                        margin: const EdgeInsets.only(right: 12, top: 12),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: products[index]['bgColor'] as Color,
                            border: _curIndex == index
                                ? Border.all(width: 3, color: Colors.white)
                                : null,
                            boxShadow: _curIndex != index
                                ? null
                                : [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 10,
                                    )
                                  ]),
                      );
                    }),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: TextWidget(text: "Details", isBold: true, size: 16),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    width: size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(descrip.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: TextWidget(
                              text:
                                  "${descrip[index]['Type']}: ${descrip[index]['description']}"),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Palettes.primaryBgColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: TextWidget(
                          text: "Add to Cart",
                          size: 18,
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Palettes.splashBgColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const TextWidget(
                          text: "Buy Now",
                          size: 18,
                          isBold: true,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      title: Image.asset(
        'assets/Audiozic_logo.png',
        width: 100,
        height: 50,
        color: Palettes.splashBgColor,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.shop,
            color: Colors.black.withOpacity(0.5),
            size: 28,
          ),
        ),
      ],
      centerTitle: true,
    );
  }
}
// Stack(
//                             children: [
//                               Positioned(
//                                 top: 0,
//                                 bottom: 30,
//                                 left: 10,
//                                 child: Transform.rotate(
//                                   angle: pi / 3.5,
//                                   child: SvgPicture.asset(
//                                     "assets/triangle.svg",
//                                     height: 300,
//                                     color: Colors.red.withOpacity(0.4),
//                                     // color: products[index]['bgColor'] as Color,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 0,
//                                 right: 0,
//                                 bottom: 20,
//                                 top: 5,
//                                 child: Transform.rotate(
//                                   angle: -pi / 5.5,
//                                   child: Image.asset(
//                                     "assets/product-2.png",
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
