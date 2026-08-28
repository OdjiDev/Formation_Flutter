import 'package:flutter/material.dart';
import 'package:mon_premier_projet/ui/widgets/main_drawer.dart';
import '../../models/document_cours.dart';
import '../widgets/coursCard.widget.dart';

class ListCoursPage extends StatelessWidget {
  const ListCoursPage({super.key});

  final List<DocumentCours> listeDesCours = const [
    DocumentCours(
      titre: 'Cours de complexe',
      nomFichierAsset: 'courcplx.pdf',
      description: 'notion de base sur les nombres complexes',
    ),
     DocumentCours(
      titre: 'Arithmetique',
      nomFichierAsset: 'courarit.pdf',
      description: 'notion de base sur l arithmetique',
    ),
     DocumentCours(
      titre: 'Fonctions Numeriques',
      nomFichierAsset: 'courfctn.pdf',
      description: 'notion de base sur les fonctions numériques ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Cours Intégrés'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
         drawer: const MainDrawer(),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: listeDesCours.length,
        itemBuilder: (context, index) {
          return CoursCard(cours: listeDesCours[index]);
        },
      ),
    );
  }
}