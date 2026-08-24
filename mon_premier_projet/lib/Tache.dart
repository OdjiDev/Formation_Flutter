
 enum Priorite{
  haute,
  base,
  moyenne
}
class Tache {
  final String id;
  String titre;
  String? description;
  bool esTermine;
   final DateTime dateCreation;
  Priorite priorite;
  Tache({
    required this.id, 
    required this.titre,
    required this.dateCreation,
    required this.priorite,
    this.esTermine=false,
    this.description,
  });
  Map<String,dynamic> toJson(){
    return {
      "id":id,
      "titre":titre,
      "description":description,
      "esTermine":esTermine,
      "dateCreation":dateCreation,
      "priorite":priorite,
    };
    
  }

  String toString(){
    return "$id $titre $dateCreation $priorite $esTermine $description";
  }
}
