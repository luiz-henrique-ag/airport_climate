import 'package:airport_climate/models/airport.dart';
import 'package:airport_climate/widgets/bottom_bar.dart';
import 'package:airport_climate/widgets/main_content.dart';
import 'package:airport_climate/widgets/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainContent(
                    selectedAirport: Airport.currentAirport('São Paulo'),
                    selectedWeather: null),
                const BottomBar()
              ],
            ),
          ),
        )),
        routes: {
          '/search': (context) => const SearchComponent(),
        });
  }
}
