import 'package:airport_climate/models/airport.dart';
import 'package:airport_climate/utils/flight_condition.dart';
import 'package:flutter/material.dart';

class AirportStats extends StatelessWidget {
  final Airport? currentAirport;
  const AirportStats({super.key, this.currentAirport});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          currentAirport!.icaoCode.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.airplanemode_active,
                        size: 48,
                      )
                    ],
                  ),
                  Text(
                    currentAirport!.name.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                  
                  (
                    currentAirport?.iataCode.toString() != "NULL" ? 
                      Text(
                      currentAirport!.iataCode.toString(),
                      style: const TextStyle(fontSize: 12),
                      )
                    :
                      Text("")
                  ),
                  const Text(
                    "Brasil",
                    style: TextStyle(fontSize: 12),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.location_on_outlined),
                          ),
                          Text(
                            currentAirport!.location.toString(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        currentAirport!.municipality.toString(),
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Condição de Voo",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    FlightCondition.analisarViabilidade(
                      currentAirport?.weather?.condition,
                      currentAirport?.weather?.visibility,
                      currentAirport?.weather?.wind
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
