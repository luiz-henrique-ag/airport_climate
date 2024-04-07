import 'dart:async';

import 'package:airport_climate/models/db/database.dart';
import 'package:airport_climate/models/weather.dart';

class Airport {
  String id;
  String iataCode;
  String icaoCode;
  String name;
  String location; // Coordinates
  String municipality;
  Weather? weather;

  Airport({
    required this.id,
    required this.iataCode,
    required this.icaoCode,
    required this.name,
    required this.location,
    required this.municipality,
  });
  @override
  String toString() {
    // TODO: implement toString
    return 'Nome :$name, Cidade: $municipality';
  }

  static Future<List<Airport?>> listAirports() async {
    final db = await Banco.instance.database;

    List<Map<String, Object?>> airportList =
        await db.rawQuery('SELECT * FROM airport_data');
    List<Airport> airports = [];
    if (airportList.isNotEmpty) {
      for (Map<String, Object?> utemp in airportList) {
        airports.add(Airport(
          id: utemp['id'].toString(),
          iataCode: utemp['iata_code'].toString(),
          icaoCode: utemp['ident'].toString(),
          name: utemp['name'].toString(),
          location: utemp['coordinates'].toString(),
          municipality: utemp['municipality'].toString(),
        ));
      }
    }
    return airports;
  }

  static Future<List<Airport?>> findAirportByCity(String city) async {
    final db = await Banco.instance.database;
    String query =
        "SELECT * FROM airport_data WHERE municipality LIKE '%$city%'";
    List<Map<String, Object?>> cityAirports = await db.rawQuery(query);
    List<Airport> airportsByCity = [];
    if (cityAirports.isNotEmpty) {
      for (Map<String, Object?> utemp in cityAirports) {
        airportsByCity.add(Airport(
          id: utemp['id'].toString(),
          iataCode: utemp['iata_code'].toString(),
          icaoCode: utemp['ident'].toString(),
          name: utemp['name'].toString(),
          location: utemp['coordinates'].toString(),
          municipality: utemp['municipality'].toString(),
        ));
      }
    }
    return airportsByCity;
  }

  static Airport? currentAirport(String city) {
    Completer<Airport?> completer = Completer<Airport?>();

    void _fetchAirport() async {
      final db = await Banco.instance.database;
      String query =
          "SELECT * FROM airport_data WHERE municipality LIKE '%$city%'";
      List<Map<String, Object?>> cityAirports = await db.rawQuery(query);
      if (cityAirports.isNotEmpty) {
        Map<String, Object?> utemp = cityAirports.first;
        completer.complete(Airport(
          id: utemp['id'].toString(),
          iataCode: utemp['iata_code'].toString(),
          icaoCode: utemp['ident'].toString(),
          name: utemp['name'].toString(),
          location: utemp['coordinates'].toString(),
          municipality: utemp['municipality'].toString(),
        ));
      } else {
        completer.complete(null);
      }
    }

    return null;
  }
}
