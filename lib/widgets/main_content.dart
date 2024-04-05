import 'package:airport_climate/models/airport.dart';
import 'package:airport_climate/models/weather.dart';
import 'package:airport_climate/widgets/airport_stats.dart';
import 'package:airport_climate/widgets/climate_stats.dart';
import 'package:flutter/material.dart';

Weather weather = Weather(
  condition: "ps",
  atmosphericPressure: "1014",
  temperature: 28,
  moisture: 74,
  wind: 29,
  visibility: "9000",
  conditionDesc: "Predomínio de Sol"
);


class MainContent extends StatefulWidget{
  const MainContent({super.key});
  
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
          ClimateStats(weather: weather),
          const AirportStats()
        ],
      ),
    );
  }
}
