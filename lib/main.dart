import 'package:dnd_partyfinder/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Map<int, Color> colorCodes = {
  50: const Color.fromRGBO(229, 57, 53, 0.1),
  100: const Color.fromRGBO(229, 57, 53, 0.2),
  200: const Color.fromRGBO(229, 57, 53, 0.3),
  300: const Color.fromRGBO(229, 57, 53, 0.4),
  400: const Color.fromRGBO(229, 57, 53, 0.5),
  500: const Color.fromRGBO(229, 57, 53, 0.6),
  600: const Color.fromRGBO(229, 57, 53, 0.7),
  700: const Color.fromRGBO(229, 57, 53, 0.8),
  800: const Color.fromRGBO(229, 57, 53, 0.9),
  900: const Color.fromRGBO(229, 57, 53, 1)
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFE53935, colorCodes),
      ),
      home: const HomePage(title: 'Recherche de joueurs'),
    );
  }
}
