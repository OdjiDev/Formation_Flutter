import 'package:flutter/material.dart';

// Importation des pages (adaptez les dossiers si vos fichiers sont dans lib/pages)
import 'ui/pages/home_page.dart';
import 'ui/pages/cours_page.dart';
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
        '/cours': (context) => const CoursPage(),
        '/etudiants': (context) => const EtudiantsPage(),
        '/parametres': (context) => const ParametresPage(),
        '/propos': (context) => const ProposPage(),
      },

      // Sécurité : évite les plantages si une route n'est pas trouvée
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      },
    );
  }
}