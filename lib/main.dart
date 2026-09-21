// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mon_premier_projet/core/security/api_client.dart';
import 'package:mon_premier_projet/core/security/routes/app_router.dart';
import 'package:mon_premier_projet/features/auth/pages/login_page.dart';
import 'package:mon_premier_projet/features/categories/pages/categorie_page.dart';

 // Import du fichier de routage centralisé
void main() async {
  // Nécessaire si on fait des appels async (comme lire le secure storage) avant runApp
  WidgetsFlutterBinding.ensureInitialized();

  
  runApp(
  ProviderScope(
    // child:MyApp())
    child: MyApp(),)
  );

}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On écoute le routerProvider défini dans core/routes/app_router.dart
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Mon Application Spring Boot & Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // On utilise MaterialApp.router à la place de MaterialApp classique
      routerConfig: router,
    );
  }
}