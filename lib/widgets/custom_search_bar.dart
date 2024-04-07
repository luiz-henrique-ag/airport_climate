import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          // onPressed:
          // () => showDialog(
          //   context: context,
          //   builder: (context) => Dialog(
          //     alignment: Alignment.center,
          //     child: Container(
          //         padding: const EdgeInsets.all(20.0),
          //         height: 250,
          //         width: 250,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             const Text(
          //               "Buscar Localização",
          //               style: TextStyle(
          //                   fontSize: 20, fontWeight: FontWeight.bold),
          //             ),
          //             TextField(
          //               decoration: InputDecoration(
          //                   hintText: "Buscar",
          //                   suffixIcon: const Icon(Icons.search),
          //                   border: OutlineInputBorder(
          //                       borderRadius: BorderRadius.circular(20)),
          //                   focusColor: Colors.blue),
          //             ),
          //             const Expanded(flex: 10, child: AirportList())
          //           ],
          //         )),
          //   ),
          // ),
          onPressed: () => {Navigator.pushNamed(context, '/search')},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            "Montes Claros",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "Hoje, 05 de Abril 15:33",
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ],
              ),
              Icon(Icons.search_sharp, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }
}
