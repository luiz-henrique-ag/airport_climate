import 'package:airport_climate/models/weather.dart';
import 'package:airport_climate/utils/weather_icon.dart';
import 'package:airport_climate/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class ClimateStats extends StatelessWidget {
  const ClimateStats({super.key, required this.weather});

  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            height: 400,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                    color: Colors.grey),
              ],
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(255, 59, 176, 239),
                    Color.fromARGB(255, 23, 81, 175),
                  ]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomSearchBar(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WeatherIcon.getWeatherIcon(weather),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${weather.temperature}º",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          weather.conditionDesc,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(
                          Icons.air,
                          color: Colors.white,
                        ),
                        const Text(
                          "Vento",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("${weather.wind} km/h",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.water_drop_outlined,
                          color: Colors.white,
                        ),
                        const Text(
                          "Umidade",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("${weather.moisture}%",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                        ),
                        const Text(
                          "Visibilidade",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("${weather.visibility} m",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12)),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
