import 'package:airport_climate/api/api.dart';
import 'package:airport_climate/models/airport.dart';
import 'package:airport_climate/models/weather.dart';
import 'package:airport_climate/widgets/main_content.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _cityInputController = TextEditingController();
  final TextEditingController _airportInputController = TextEditingController();

  Future<List<Airport?>>? _futureAirportsByCity;

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
            TextField(
              controller: _cityInputController,
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
            const SizedBox(height: 10),
            TextField(
              controller: _airportInputController,
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
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              height: 60,
              child: TextButton(
                onPressed: () {
                  String city = _cityInputController.text;
                  setState(() {
                    _futureAirportsByCity = Airport.findAirportByCity(city);
                  });
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 23, 81, 175)),
                ), 
                child: const Text(
                  "Pesquisar", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3
                  )
                )
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Airport?>>(
                future: _futureAirportsByCity,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
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
                                //CHAMAR A API E MONTAR AS INFORMAÇÕES
                                API.getAirportWeather(snapshot.data![index]!.icaoCode)
                                    .then((value) => {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => MainContent(
                                                  selectedAirport:
                                                      snapshot.data![index],
                                                  selectedWeather: value),
                                            ),
                                          )
                                        });
                                //Navegar para a próxima rota ao clicar no Card
                              },
                              child: Card(
                                color: Color.fromARGB(255, 59, 176, 239),
                                child: ListTile(
                                  textColor: Colors.white,
                                  title: Text(snapshot.data![index]!.name),
                                  subtitle:
                                      Text(snapshot.data![index]!.municipality),
                                ),
                              ));
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
