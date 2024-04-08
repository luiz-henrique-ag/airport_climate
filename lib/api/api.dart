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
        Weather obj = Weather(
          moisture: jsonResp['umidade'].toString(),
          visibility: jsonResp['visibilidade'].toString(),
          atmosphericPressure:
              jsonResp['pressao_atmosferica'].toString(),
          wind: jsonResp['vento'].toString(),
          condition: jsonResp['condicao'].toString(),
          conditionDesc: jsonResp['condicao_desc'].toString(),
          temperature: jsonResp['temp'].toString(),
        );
        return obj;
      }
    }
    return null;
  }
}
