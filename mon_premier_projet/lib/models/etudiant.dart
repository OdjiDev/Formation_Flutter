class Etudiant {
  final String id;
  final String matricule;
  final String nom;
  final String prenom;
  final String email;
  final String filiere;

  Etudiant({
    required this.id,
    required this.matricule,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.filiere,
  });

  String get nomComplet => '$prenom $nom';

  // Conversion depuis du JSON (Reçu de Spring Boot)
  factory Etudiant.fromJson(Map<String, dynamic> json) {
    return Etudiant(
      id: json['id']?.toString() ?? '',
      matricule: json['matricule'] ?? '',
      nom: json['nom'] ?? '',
      prenom: json['prenom'] ?? '',
      email: json['email'] ?? '',
      filiere: json['filiere'] ?? '',
    );
  }

  // Conversion vers du JSON (Envoyé à Spring Boot)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'matricule': matricule,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'filiere': filiere,
    };
  }
}