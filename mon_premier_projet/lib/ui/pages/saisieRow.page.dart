
import 'package:flutter/material.dart';

import '../widgets/drawer.widget.dart';



class Saisie extends StatelessWidget {
  const Saisie ({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(), // Intégration de votre drawer
      appBar: AppBar(title: const Text('Formulaire en Ligne')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // LIGNE 1 : NOM
            Row(
              children: const [
                SizedBox(
                  width: 80, // Largeur fixe pour aligner les libellés
                  child: Text(
                    'Nom :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Entrez votre nom',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // LIGNE 2 : PRÉNOM
            Row(
              children: const [
                SizedBox(
                  width: 80,
                  child: Text(
                    'Prénom :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Entrez votre prénom',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}