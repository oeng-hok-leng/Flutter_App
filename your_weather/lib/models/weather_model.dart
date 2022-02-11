import 'dart:core';

class Weather {
  String name;
  DateTime date = DateTime.now();
  double temp;
  double tempMin;
  double tempMax;
  int humidity;
  double speed;

  Weather({
    this.name = '',
    this.temp = 0,
    this.tempMax = 0,
    this.tempMin = 0,
    this.humidity = 0,
    this.speed = 1,
  });
}
