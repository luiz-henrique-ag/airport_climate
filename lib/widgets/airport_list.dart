import 'package:flutter/material.dart';
import 'package:airport_climate/models/airport.dart';

class AirportList extends StatefulWidget {
  const AirportList({super.key});

  @override
  State<AirportList> createState() => _AirportListState();
}

class _AirportListState extends State<AirportList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<Airport?>>(
            future: Airport.listAirports(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Expanded(
                      flex: 9, child: Center(child: Text('Está Vazio')));
                } else {
                  List<Airport?> lista = snapshot.data!;
                  return Expanded(
                    flex: 10,
                    child: ListView.builder(
                        itemCount: lista.length,
                        itemBuilder: (context, index) {
                          Airport? airport = lista[index];
                          return Card(
                            child: ListTile(
                              title: Text(airport!.name),
                            ),
                          );
                        }),
                  );
                }
              } else {
                return const Expanded(
                    flex: 9, child: Center(child: CircularProgressIndicator()));
              }
            })),
      ],
    );
  }
}
