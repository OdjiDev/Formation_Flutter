class Categorie {
  final int? id;
  String nom;

  Categorie({this.id, required this.nom});

  factory Categorie.fromJson(Map<String, dynamic> json) {
    return Categorie(
      id: json['id'],
      nom: json['nom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
    };
  }
}