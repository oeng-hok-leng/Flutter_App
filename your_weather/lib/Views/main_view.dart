import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:your_weather/Constants/palettes.dart';
import 'package:your_weather/Controllers/weather_controller.dart';
import 'package:your_weather/Views/widgets/statistic_widget.dart';
import 'package:your_weather/Views/widgets/text_widget.dart';
import 'package:weather_icons/weather_icons.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final WeatherController _controller = Get.put(WeatherController());
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          color: Palette.secondaryColor,
          child: GetBuilder<WeatherController>(
              init: _controller,
              builder: (weather) {
                final weatherValue = weather.weather.value;
                return Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        margin: const EdgeInsets.only(top: 80),
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: weatherValue.name,
                              size: 32,
                              color: Colors.white,
                              isbold: true,
                            ),
                            TextWidget(
                              text:
                                  DateFormat.yMEd().add_jms().format(DateTime.now()),
                              color: Colors.white.withOpacity(0.8),
                            ),
                            SizedBox(height: size.height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    Icon(Icons.cloud_outlined,
                                        size: 64, color: Colors.white),
                                    TextWidget(
                                      text: "Clouds",
                                      size: 18,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                TextWidget(
                                  text: "${weatherValue.temp}º",
                                  size: 64,
                                  color: Colors.white,
                                  isbold: true,
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.05),
                            Container(
                              height: size.height * 0.3,
                              width: size.width,
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: size.height * 0.3,
                          width: size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget(
                                text: "Weather now",
                                size: 18,
                                isbold: true,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  StatisticWidget(
                                    data: "${weatherValue.tempMin}º",
                                    description: "Min temp",
                                    icon: Icons.thermostat,
                                  ),
                                  StatisticWidget(
                                    data: "${weatherValue.tempMax}º",
                                    description: "Max temp",
                                    icon: Icons.thermostat,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  StatisticWidget(
                                    data: "${weatherValue.speed}m/s",
                                    description: "Wind speed",
                                    icon: WeatherIcons.wind_beaufort_0,
                                  ),
                                  StatisticWidget(
                                    data: "${weatherValue.humidity}",
                                    description: "Humidity",
                                    icon: Icons.thermostat,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                );
              })),
    );
  }
}
