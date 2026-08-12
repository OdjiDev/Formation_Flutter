// lib/main.dart

import 'package:catalogue_produits/ui/pages/home.page.dart';
import 'package:catalogue_produits/ui/pages/meteo.page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context) => HomePage(),
        "/meteo": (context) => MeteoPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.grey, // Color.fromARGB(255, 97, 104, 110),
        useMaterial3: false, //Il est true par defaut sur la version recente de fluteur

      ),
      initialRoute:"/meteo"
    );
  }


}

