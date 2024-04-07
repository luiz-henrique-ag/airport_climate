import 'package:airport_climate/models/airport.dart';
import 'package:airport_climate/models/weather.dart';
import 'package:airport_climate/widgets/airport_stats.dart';
import 'package:airport_climate/widgets/climate_stats.dart';
import 'package:flutter/material.dart';

class MainContent extends StatefulWidget {
  final Airport? selectedAirport;
  final Weather? selectedWeather;

  MainContent({required this.selectedAirport, this.selectedWeather, Key? key})
      : super(key: key);

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 14,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClimateStats(
              weather: widget.selectedWeather ??
                  Weather(
                      atmosphericPressure: '',
                      visibility: '',
                      wind: '',
                      moisture: '',
                      condition: '',
                      temperature: '',
                      conditionDesc: '')), // Use widget.selectedWeather
          AirportStats(
            currentAirport: widget.selectedAirport,
          ),
        ],
      ),
    );
  }
}
