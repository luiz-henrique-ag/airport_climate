import 'dart:convert';

import 'package:airport_climate/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class API {
  static Future<Weather?> getAirportWeather(String icao) async {
    print(icao);
    Response res = await http.get(Uri.parse(
        'https://brasilapi.com.br/api/cptec/v1/clima/aeroporto/$icao'));
    if (res.statusCode == 200) {
      final Map<String, dynamic> jsonResp = json.decode(res.body);

      if (jsonResp.isNotEmpty) {
        return Weather(
          moisture: jsonResp['moisture']?.toString() ?? '',
          visibility: jsonResp['visibility']?.toString() ?? '',
          atmosphericPressure:
              jsonResp['atmospheric_pressure']?.toString() ?? '',
          wind: jsonResp['wind']?.toString() ?? '',
          condition: jsonResp['condition']?.toString() ?? '',
          conditionDesc: jsonResp['condition_desc']?.toString() ?? '',
          temperature: jsonResp['temperature']?.toString() ?? '',
        );
      }
    }
    return null;
  }
}
