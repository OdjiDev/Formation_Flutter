import 'package:flutter/material.dart';

// J'ai commenté votre drawer pour que le code compile sans
// import '../widgets/drawer.widget.dart';

class ChampsSaisie extends StatelessWidget {
  const ChampsSaisie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MyDrawer(), // Remettez cette ligne quand vous l'utilisez
      appBar: AppBar(title: const Text('Deux Champs de Texte')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Pour centrer l'image horizontalement
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10), // Petit espace en haut

            // ====== INSERTION DE L'IMAGE DEPUIS ASSET ======
            // Assurez-vous que le chemin correspond EXACTEMENT
           
             CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.png"),
                radius: 40,
            ),


            Image.asset(
              'assets/images/logo.png', // Le chemin complet déclaré
               height: 120, // Hauteur fixe
               fit: BoxFit.contain, // Adapte l'image sans la déformer
            ),
            const SizedBox(height: 30), // Espace après l'image

            // Votre formulaire en ligne (coordonnées)
            Row(
              children: [
                const SizedBox(
                  width: 80,
                  child: Text(
                    'Nom :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Entrez votre nom',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16), // Espace entre les deux rows

            Row(
              children: [
                const SizedBox(
                  width: 80,
                  child: Text(
                    'Prénom :',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Entrez votre prénom',
                      border: OutlineInputBorder(),
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

// Juste pour tester sans erreur, j'ajoute un main minimaliste
