import 'package:airport_climate/api/api.dart';
import 'package:airport_climate/models/airport.dart';
import 'package:airport_climate/models/weather.dart';
import 'package:airport_climate/pages/home.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GPS {
  
  static Future<StatsViewModel> determinePosition() async {
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
    Position pos = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    List<Airport?> airports = await Airport.findAirportByCity(placemarks.first.subAdministrativeArea!);
    Weather? weather = await API.getAirportWeather(airports.first!.icaoCode);
    airports.first!.weather = weather;
    return StatsViewModel(airport: airports.first!, weather: weather!);
  }
}