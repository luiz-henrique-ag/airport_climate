import 'package:airport_climate/api/api.dart';
import 'package:airport_climate/models/airport.dart';
import 'package:airport_climate/widgets/main_content.dart';
import 'package:flutter/material.dart';

enum SearchType { City, Airport }

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _cityInputController = TextEditingController();
  final TextEditingController _airportInputController = TextEditingController();
  SearchType _searchType = SearchType.City;
  String _searchText = '';
  Future<List<Airport?>>? _futureAirports;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesquisar"),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
        backgroundColor: const Color.fromARGB(255, 23, 81, 175),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _searchType = SearchType.City;
                });
              },
              child: TextField(
                controller: _cityInputController,
                enabled: _searchType == SearchType.City,
                onChanged: (value) {
                  _searchText = value;
                },
                decoration: const InputDecoration(
                  labelText: "Cidade",
                  hintText: "Digite o nome de uma cidade",
                  prefixIcon: Icon(Icons.location_city),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  _searchType = SearchType.Airport;
                });
              },
              child: TextField(
                controller: _airportInputController,
                enabled: _searchType == SearchType.Airport,
                onChanged: (value) {
                  _searchText = value;
                },
                decoration: const InputDecoration(
                  labelText: "Aeroporto",
                  hintText: "Digite o nome do aeroporto",
                  prefixIcon: Icon(Icons.airplanemode_active),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              height: 60,
              child: TextButton(
                onPressed: () {
                  if (_searchText.isNotEmpty) {
                    if (_searchType == SearchType.City) {
                      setState(() {
                        _futureAirports =
                            Airport.findAirportByCity(_searchText);
                      });
                    } else {
                      setState(() {
                        _futureAirports =
                            Airport.findAirportByName(_searchText);
                      });
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      const Color.fromARGB(255, 23, 81, 175)),
                ),
                child: const Text(
                  "Pesquisar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Airport?>>(
                future: _futureAirports,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Erro: ${snapshot.error}'),
                    );
                  } else {
                    if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              final weather = await API.getAirportWeather(
                                  snapshot.data![index]!.icaoCode);
                              Airport selectedAirport = snapshot.data![index]!;
                              selectedAirport.weather = weather;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MainContent(
                                    selectedAirport: snapshot.data![index],
                                    selectedWeather: weather,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: const Color.fromARGB(255, 59, 176, 239),
                              child: ListTile(
                                textColor: Colors.white,
                                title: Text(snapshot.data![index]!.name),
                                subtitle: Text(
                                  snapshot.data![index]!.municipality,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text('Nenhum aeroporto encontrado.'),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}