import 'package:e_commerce_app/root_app.dart';
import 'package:e_commerce_app/views/detail_product_view.dart';

import 'package:e_commerce_app/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        RootApp.routeName: (ctx) => const RootApp(),
        DetailProductView.routeName: (ctx) => DetailProductView(),
      },
    );
  }
}
