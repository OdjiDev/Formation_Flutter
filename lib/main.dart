// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_premier_projet/core/security/api_client.dart';
import 'package:mon_premier_projet/features/auth/pages/login_page.dart';
import 'package:mon_premier_projet/features/categories/pages/categorie_page.dart';


void main() async {
  // Nécessaire si on fait des appels async (comme lire le secure storage) avant runApp
  WidgetsFlutterBinding.ensureInitialized();

  // On vérifie si un token est déjà présent pour décider de la page d'accueil
  final apiClient = ApiClient();
  final bool isLogged = await apiClient.hasToken();

  runApp(
  ProviderScope(
    // child:MyApp())
    child: MyApp(isLoggedIn: isLogged),)
  );

}
class MyApp extends StatelessWidget {

  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});
  // const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application Spring Boot & Flutter',
      
      theme: ThemeData(
        primarySwatch: Colors.grey, // Color.fromARGB(255, 97, 104, 110),
        useMaterial3: false, //Il est true par defaut sur la version recente de fluteur

      ),
      // Si l'utilisateur a déjà un token valide, on va direct sur CategoriePage, sinon Login
      home: isLoggedIn ? const CategoriePage() : const LoginPage(),
    );
  }



  }

