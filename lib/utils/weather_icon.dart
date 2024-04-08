import 'package:airport_climate/models/weather.dart';
import 'package:flutter/material.dart';

class WeatherIcon{
  static Widget getWeatherIcon(Weather weather){
    String condition = weather.conditionDesc;
    if(condition.toLowerCase().contains("chuv")){
      return const Icon(
        Icons.water_drop_sharp,
        size: 100,
        color: Colors.white,
      );
    }
    if(condition.toLowerCase().contains("sol")){
      return const Icon(
        Icons.sunny,
        size: 100,
        color: Colors.amber,
      );
    }
    if(condition.contains("nublado")){
      return const Icon(
        Icons.cloud,
        size: 100,
        color: Colors.grey,
      );
    }
    return const Icon(
        Icons.wb_incandescent_sharp,
        size: 100,
        color: Colors.red,
      );
  }
}