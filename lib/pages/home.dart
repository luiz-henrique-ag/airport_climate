import 'package:airport_climate/models/airport.dart';
import 'package:airport_climate/models/weather.dart';
import 'package:airport_climate/utils/gps.dart';
import 'package:airport_climate/widgets/bottom_bar.dart';
import 'package:airport_climate/widgets/main_content.dart';
import 'package:flutter/material.dart';

class StatsViewModel {
  Weather weather;
  Airport airport;

  StatsViewModel({ required this.airport, required this.weather});
}

class AirportPage extends StatelessWidget {
  const AirportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<StatsViewModel>(
            future: GPS.determinePosition(), 
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 23, 81, 175),
                    ),
                  ) 
                );
              }
              else if(snapshot.hasError){
                return Expanded(child: Center(child: Text(snapshot.data.toString())));
              }
              else if(snapshot.hasData){
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainContent(selectedAirport: snapshot.data?.airport, selectedWeather: snapshot.data?.weather),
                      const BottomBar()
                    ],
                );
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Não foi possível usar o serviço de localização."),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/search'), 
                      child: const Text('Buscar Localidade')
                    )
                  ],
                ),
              );
            }
          )
        ),
      )
    );
  }
}
