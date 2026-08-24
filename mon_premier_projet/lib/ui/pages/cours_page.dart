import 'package:flutter/material.dart';
import '../../models/cours.dart';
import '../widgets/main_drawer.dart';

class CoursPage extends StatelessWidget {
  const CoursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Cours'),
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: listeDesCours.length,
        itemBuilder: (context, index) {
          final cours = listeDesCours[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: Icon(cours.icone, color: Colors.indigo),
              ),
              title: Text(
                '${cours.code} - ${cours.titre}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text('Enseignant : ${cours.enseignant}'),
                  Text('Volume Horaire : ${cours.volumeHoraire}h'),
                ],
              ),
              trailing: const Icon(Icons.info_outline, color: Colors.grey),
              onTap: () {
                // Action au clic : Afficher le détail
                _afficherDetailCours(context, cours);
              },
            ),
          );
        },
      ),
    );
  }

  // Fonction pour afficher le détail du cours dans un dialogue
  void _afficherDetailCours(BuildContext context, Cours cours) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${cours.code} : ${cours.titre}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Enseignant : ${cours.enseignant}', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text('Description :', style: TextStyle(decoration: TextDecoration.underline)),
                const SizedBox(height: 5),
                Text(cours.description),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}