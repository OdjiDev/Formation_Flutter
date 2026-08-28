import 'package:flutter/material.dart';
import 'package:mon_premier_projet/ui/pages/ListCours.page.dart';
import 'package:mon_premier_projet/ui/pages/passageExamen.page.dart';
import 'package:mon_premier_projet/ui/pages/tachePage.dart';

// Importation des pages (adaptez les dossiers si vos fichiers sont dans lib/pages)
import 'ui/pages/home.page.dart';
import 'ui/pages/etudiants_page.dart';
import 'ui/pages/parametres_page.dart';
import 'ui/pages/propos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion Académique',
      debugShowCheckedModeBanner: false,
      
      // Configuration du thème principal (Indigo comme dans vos captures)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),

      // Page de démarrage
      initialRoute: '/',

      // Déclaration des routes (doivent être identiques aux routes appelées dans le Drawer)
      routes: {
        '/': (context) => const HomePage(),
       
        '/etudiants': (context) => const EtudiantsPage(),
        '/parametres': (context) => const ParametresPage(),
        '/propos': (context) => const ProposPage(),
        '/taches': (context) => const TachesPage(),
        '/listCours': (context) => const ListCoursPage(),
        '/examen': (context) => const PassageExamenPage(titreCours: 'Examen',),
      },

      // Sécurité : évite les plantages si une route n'est pas trouvée
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const ListCoursPage(),
        );
      },
    );
  }
}