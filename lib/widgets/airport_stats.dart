import 'package:flutter/material.dart';

class AirportStats extends StatelessWidget {
  const AirportStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text(
                            "SBMK",
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Icon(
                          Icons.airplanemode_active,
                          size: 48,
                        )
                      ],
                    ),
                    Text(
                      "Aeroporto de Montes Claros - Mário Ribeiro",
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                    Text(
                      "MOC",
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                    Text(
                      "Brasil",
                      style: TextStyle(
                        fontSize: 12
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.location_on_outlined),
                        ),
                        Text("-16.706919, -43.818901")
                      ],
                    )
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Condição de Voo",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text("Muito Bom")
              ],
            )
          ],
        ),
      ),
    );
  }
}
