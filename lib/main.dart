import 'package:airport_climate/widgets/bottom_bar.dart';
import 'package:airport_climate/widgets/main_content.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            MainContent(),
            BottomBar()
          ],
        ),
      ),
    );
  }
}
