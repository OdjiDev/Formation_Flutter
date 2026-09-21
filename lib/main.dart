// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_premier_projet/features/categories/pages/categorie_page.dart';


void main() {
  runApp(
  ProviderScope(
    child:MyApp())
  );

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/categorie': (context) => const CategoriePage(),
      
    
        
      },
      theme: ThemeData(
        primarySwatch: Colors.grey, // Color.fromARGB(255, 97, 104, 110),
        useMaterial3: false, //Il est true par defaut sur la version recente de fluteur

      ),
      initialRoute:"/categorie"
    );
  }



  }

