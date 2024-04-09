import 'package:airport_climate/pages/home.dart';
import 'package:airport_climate/pages/search.dart';
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
        initialRoute: '/', 
        routes: {
          '/': (context) => const AirportPage(),
          '/search' : (context) => const SearchPage(),
        });
  }
}
