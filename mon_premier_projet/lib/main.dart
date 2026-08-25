import 'package:flutter/material.dart';
import 'package:mon_premier_projet/ui/pages/AddEditEtudiantPage.dart';
import 'ui/pages/etudiants_page.dart';// Import de la page CRUD

void main() {
  runApp(const MonAppCrud());
}

class MonAppCrud extends StatelessWidget {
  const MonAppCrud({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const EtudiantsPage(),
        '/addEtudiant': (context) => const AddEditEtudiantPage(),
        '/editEtudiant': (context) => const AddEditEtudiantPage(),
      },
      title: 'CRUD Étudiants Spring Boot',
      debugShowCheckedModeBanner: false,
      
      // Configuration du thème
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      // Définition de la page principale (CRUD Étudiants)
     initialRoute: '/',
    );
  }
}