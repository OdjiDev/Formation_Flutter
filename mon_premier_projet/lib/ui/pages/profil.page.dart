
import 'package:flutter/material.dart';


class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});


  @override
  Widget build(BuildContext context) {
    // Étape 5 (Bonus) : Largeur responsive (85% de l'écran)
    final double largeurEcran = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[200], // Fond de page grisé
      appBar: AppBar(
        title: const Text('Mon Profil'),
        centerTitle: true,
      ),
      // Étape 5 (Bonus) : Défilement pour éviter les débordements en mode paysage
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            // Étape 3 : Container stylisé
            child: Container(
              width: largeurEcran * 0.85,
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(24.0), // Padding intérieur de 24
              decoration: BoxDecoration(
                color: Colors.white, // Fond blanc
                borderRadius: BorderRadius.circular(16.0), // Coins arrondis (16)
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Ombre portée
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              // Étape 2 : Structure des éléments
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Avatar
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                  ),
                  const SizedBox(height: 16),

                  // Nom complet
                  const Text(
                    'Djiré Ouzairou',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Métier
                  const Text(
                    'Développeur & Formateur',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Ligne Email
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.email, color: Colors.indigo, size: 20),
                      SizedBox(width: 8),
                      Text('contact@entreprise.com'),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Ligne Téléphone
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phone, color: Colors.indigo, size: 20),
                      SizedBox(width: 8),
                      Text('+223 70 00 00 00'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Bouton Contacter
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Action "Contacter" cliquée !')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Contacter'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}