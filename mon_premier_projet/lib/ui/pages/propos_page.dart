import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class ProposPage extends StatelessWidget {
  const ProposPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À Propos'),
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.school, size: 80, color: Colors.indigo),
            const SizedBox(height: 15),
            const Text(
              'Portail Académique TP',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              'Cette application a été développée dans le cadre du TP de Développement Mobile Flutter. Elle illustre la gestion du routage nommé, de la navigation par Drawer, et de l\'affichage de listes dynamiques.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 40),
            
            // Section Auteur
            const Divider(),
            const Text(
              'Réalisé par :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '[Votre Nom & Prénom]',
              style: TextStyle(fontSize: 18, color: Colors.indigo),
            ),
            const Text('Filière / Promotion 202X'),
            const SizedBox(height: 30),
            
            ElevatedButton.icon(
              icon: const Icon(Icons.contact_support),
              label: const Text('Contacter le support'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => const AlertDialog(
                    title: Text('Support'),
                    content: Text('Contactez l\'enseignant responsable ou l\'administration.'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}