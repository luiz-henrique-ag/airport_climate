import 'package:airport_climate/models/airport.dart';
import 'package:flutter/material.dart';

class AirportStats extends StatelessWidget {
  final Airport? currentAirport;
  const AirportStats({super.key, this.currentAirport});

  @override
  Widget build(BuildContext context) {
    // Verifica se currentAirport é nulo antes de acessar suas propriedades
    if (currentAirport == null || currentAirport!.icaoCode.isEmpty) {
      return Expanded(
        flex: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Row(
              //children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "",
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
                    "",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    "",
                    style: const TextStyle(fontSize: 12),
                  ),
                  const Text(
                    "Brasil",
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.location_on_outlined),
                      ),
                      Text(
                        "",
                        style: const TextStyle(fontSize: 12),
                      )
                    ],

                    ///)
                    //],
                  )
                ],
              ),
              const SizedBox(
                  height: 10), // Adiciona um espaçamento entre os elementos
              const Text(
                "Condição de Voo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text("Muito Bom")
            ],
          ),
        ),
      );
    }

    return Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Row(
            //children: [
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
                Text(
                  currentAirport!.iataCode.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
                const Text(
                  "Brasil",
                  style: TextStyle(fontSize: 12),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.location_on_outlined),
                    ),
                    Text(
                      currentAirport!.location.toString(),
                      style: const TextStyle(fontSize: 12),
                    )
                  ],

                  ///)
                  //],
                )
              ],
            ),
            const SizedBox(
                height: 10), // Adiciona um espaçamento entre os elementos
            const Text(
              "Condição de Voo",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Text("Muito Bom")
          ],
        ),
      ),
    );
  }
}
