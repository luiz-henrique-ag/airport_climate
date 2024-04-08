import 'package:airport_climate/widgets/bottom_bar.dart';
import 'package:airport_climate/widgets/main_content.dart';
import 'package:flutter/material.dart';

class AirportPage extends StatelessWidget {
  const AirportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainContent(selectedAirport: null, selectedWeather: null),
            const BottomBar()
          ],
        ),
      ),
    ));
  }
}
