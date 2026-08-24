import 'package:flutter/material.dart';

// 1. Modèle de données
class Cours {
  final String titre;
  final String enseignant;
  final String duree;
  final IconData icone;

  const Cours({
    required this.titre,
    required this.enseignant,
    required this.duree,
    required this.icone,
  });
}

// 2. Widget de la page
class ListeCoursPage extends StatelessWidget {
  const ListeCoursPage({super.key});

  final List<Cours> listeDesCours = const [
    Cours(
      titre: 'Développement Mobile Flutter',
      enseignant: 'Djiré Ouzairou',
      duree: '30h',
      icone: Icons.mobile_friendly,
    ),
    Cours(
      titre: 'Gestion de Bases de Données SQL',
      enseignant: 'Dr. Coulibaly',
      duree: '24h',
      icone: Icons.storage,
    ),
    Cours(
      titre: 'Systèmes d\'Information (SIG)',
      enseignant: 'M. Traoré',
      duree: '20h',
      icone: Icons.computer,
    ),
    Cours(
      titre: 'Algorithmique & Graphes',
      enseignant: 'Mme. Diarra',
      duree: '18h',
      icone: Icons.account_tree,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Cours'),
      ),
      body: ListView.builder(
        itemCount: listeDesCours.length,
        itemBuilder: (context, index) {
          final cours = listeDesCours[index];

          return ListTile(
            leading: Icon(cours.icone),
            title: Text(cours.titre),
            subtitle: Text('${cours.enseignant} - ${cours.duree}'),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(cours.titre)),
              );
            },
          );
        },
      ),
    );
  }
}