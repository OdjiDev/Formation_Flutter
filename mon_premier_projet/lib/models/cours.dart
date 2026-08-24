import 'package:flutter/material.dart';

class Cours {
  final String id;
  final String code;
  final String titre;
  final String enseignant;
  final int volumeHoraire;
  final String description;
  final IconData icone;

  const Cours({
    required this.id,
    required this.code,
    required this.titre,
    required this.enseignant,
    required this.volumeHoraire,
    required this.description,
    this.icone = Icons.book,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'titre': titre,
      'enseignant': enseignant,
      'volumeHoraire': volumeHoraire,
      'description': description,
    };
  }

  factory Cours.fromMap(Map<String, dynamic> map) {
    return Cours(
      id: map['id'] ?? '',
      code: map['code'] ?? '',
      titre: map['titre'] ?? '',
      enseignant: map['enseignant'] ?? '',
      volumeHoraire: map['volumeHoraire'] ?? 0,
      description: map['description'] ?? '',
    );
  }
}

// Données de test (Mock)
final List<Cours> listeDesCours = [
  const Cours(
    id: 'c1',
    code: 'INF301',
    titre: 'Développement Mobile Flutter',
    enseignant: 'Dr. Ouzairou',
    volumeHoraire: 40,
    description: 'Introduction aux widgets, au routage et à la Clean Architecture.',
    icone: Icons.phone_android,
  ),
  const Cours(
    id: 'c2',
    code: 'BDD201',
    titre: 'Bases de Données SQL & NoSQL',
    enseignant: 'M. Traoré',
    volumeHoraire: 30,
    description: 'Conception de schémas relationnels et requêtes complexes.',
    icone: Icons.storage,
  ),
  const Cours(
    id: 'c3',
    code: 'SIG402',
    titre: 'Systèmes d\'Information de Gestion',
    enseignant: 'Dr. Diarra',
    volumeHoraire: 25,
    description: 'Analyse des processus métiers, ERP et aide à la décision.',
    icone: Icons.analytics,
  ),
];