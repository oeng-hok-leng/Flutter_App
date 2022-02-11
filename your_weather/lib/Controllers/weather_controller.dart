import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:your_weather/models/weather_model.dart';

class WeatherController extends GetxController {
  final weather = Weather().obs;

  Future<dynamic> getWeather(double lat, double lon) async {
    const apiKey = "b9b799f6c78641e4ba5b2b7d3a32da0a";
    // final url = Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey");
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric");

    final resposne = await http.get(url);

    return json.decode(resposne.body);
    // updateWeather(data);
  }

  updateWeather(dynamic data) {
    print(data);
    weather.update((val) {
      if (val != null) {
        val.name = data['name'];
        val.temp = data['main']['temp'];
        val.tempMin = data['main']['temp_min'];
        val.tempMax = data['main']['temp_max'];
        val.humidity = data['main']['humidity'];
        val.speed = data['wind']['speed'];
      }
    });
    print(weather.value.name);
  }
}
