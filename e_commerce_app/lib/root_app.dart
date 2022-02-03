import 'package:e_commerce_app/constants/palette.dart';
import 'package:e_commerce_app/views/widgets/brand_show_widget.dart';
import 'package:e_commerce_app/views/widgets/product_show.dart';
import 'package:e_commerce_app/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);
  static const routeName = "/root-page";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            color: Palettes.primaryBgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child:
                      TextWidget(text: "Choose Brand", isBold: true, size: 16),
                ),
                BrandShowWidget(),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: TextWidget(
                      text: "Beats Products", isBold: true, size: 16),
                ),
                Expanded(
                  child: ProductShow(),
                )
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: myBottomNavBar(size),
      floatingActionButton: myFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Container myBottomNavBar(Size size) {
    return Container(
      height: 80,
      width: size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.home, color: Palettes.splashBgColor, size: 32),
            Icon(Icons.favorite, color: Colors.grey, size: 32),
            SizedBox(
              width: 25,
            ),
            Icon(Icons.list_alt, color: Colors.grey, size: 32),
            Icon(Icons.person, color: Colors.grey, size: 32),
          ],
        ),
      ),
    );
  }

  GestureDetector myFloatingButton() {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: Palettes.splashBgColor,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 3,
              color: Colors.grey.withOpacity(0.9),
            ),
          ],
        ),
        child: const Icon(
          Icons.shop_two,
          color: Colors.white,
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Icon(Icons.menu, color: Colors.black),
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
            Icons.search,
            color: Colors.black.withOpacity(0.7),
            size: 32,
          ),
        ),
      ],
      centerTitle: true,
    );
  }
}
