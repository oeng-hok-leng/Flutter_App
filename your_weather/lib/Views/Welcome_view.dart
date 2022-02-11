import 'package:flutter/material.dart';

import 'package:your_weather/Constants/palettes.dart';
import 'package:your_weather/Controllers/weather_controller.dart';
import 'package:your_weather/Views/main_view.dart';

import 'package:your_weather/Views/widgets/text_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  Position? locData;
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var location = await Geolocator.getCurrentPosition();

    setState(() {
      locData = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.put(WeatherController());
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        color: Palette.secondaryColor,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
              height: size.height * 0.3,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/your_location.png"),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextWidget(
              text: "Welcome To Your Weather",
              color: Colors.white.withOpacity(0.9),
              isbold: true,
              size: 22,
            ),
            GestureDetector(
              onTap: () async {
                await determinePosition();
                print(locData);
                var data = await WeatherController()
                    .getWeather(locData!.latitude, locData!.longitude);
                Get.find<WeatherController>().updateWeather(data);
                Get.to(() => const MainView());
              },
              child: Container(
                height: 50,
                width: size.width / 2 + 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextWidget(
                      text: "Share My Location",
                      color: Colors.white,
                      isbold: true,
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.location_on, color: Colors.white, size: 32)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
