import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:your_weather/Views/Welcome_view.dart';
import 'package:your_weather/Views/main_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.white),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeView(),
    );
  }
}
