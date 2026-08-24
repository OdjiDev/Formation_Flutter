
import 'package:flutter/material.dart';

import '../widgets/drawer.widget.dart';
class ChampsSaisie extends StatelessWidget {
  const ChampsSaisie ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deux Champs de Texte')),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ajoute de la marge autour
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16), // Espace vertical entre les deux champs
            TextField(
              decoration: InputDecoration(
                labelText: 'Prénom',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}