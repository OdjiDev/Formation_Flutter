// lib/main.dart
import 'package:flutter/material.dart';
import 'package:mon_premier_projet/ui/pages/home.page.dart';
import 'package:mon_premier_projet/ui/pages/listeCours.dart';
import 'package:mon_premier_projet/ui/pages/meteo.page.dart';
import 'package:mon_premier_projet/ui/pages/counter.page.dart';
import 'package:mon_premier_projet/ui/pages/champsSaisie.page.dart';
import 'package:mon_premier_projet/ui/pages/profil.page.dart';
import 'package:mon_premier_projet/ui/pages/saisieRow.page.dart';
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
        "/counter": (context) => CounterPage(),
        "/saisie": (context) => ChampsSaisie(),
        "/profil": (context) => ProfilPage(),
        "/saisieRow": (context) => Saisie(),
        "/listeCours": (context) => ListeCoursPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.grey, // Color.fromARGB(255, 97, 104, 110),
        useMaterial3: false, //Il est true par defaut sur la version recente de fluteur

      ),
      initialRoute:"/home"
    );
  }


}

