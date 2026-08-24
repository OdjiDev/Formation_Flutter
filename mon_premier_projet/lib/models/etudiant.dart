class Etudiant {
  final String id;
  final String matricule;
  final String nom;
  final String prenom;
  final String email;
  final String filiere;

  const Etudiant({
    required this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.filiere,
  });

  String get nomComplet => '$prenom $nom';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'matricule': matricule,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'filiere': filiere,
    };
  }

  factory Etudiant.fromMap(Map<String, dynamic> map) {
    return Etudiant(
      id: map['id'] ?? '',
      matricule: map['matricule'] ?? '',
      nom: map['nom'] ?? '',
      prenom: map['prenom'] ?? '',
      email: map['email'] ?? '',
      filiere: map['filiere'] ?? '',
    );
  }
}

// Données de test (Mock)
final List<Etudiant> listeDesEtudiants = [
  const Etudiant(
    id: 'e1',
    matricule: 'ET202601',
    nom: 'Sidibé',
    prenom: 'Moussa',
    email: 'moussa.sidibe@email.com',
    filiere: 'Génie Informatique',
  ),
  const Etudiant(
    id: 'e2',
    matricule: 'ET202602',
    nom: 'Keita',
    prenom: 'Aïssata',
    email: 'aissata.keita@email.com',
    filiere: 'Gestion des Systèmes d\'Information',
  ),
  const Etudiant(
    id: 'e3',
    matricule: 'ET202603',
    nom: 'Coulibaly',
    prenom: 'Oumar',
    email: 'oumar.coulibaly@email.com',
    filiere: 'Réseaux & Télécoms',
  ),
];