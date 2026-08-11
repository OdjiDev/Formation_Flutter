class Utilisateur {
final String id;
final String nom;
final int age;
final String? email;
// Constructeur principal
Utilisateur({
required this.id,
required this.nom,
required this.age,
this.email,
});
// Named constructor (constructeur nommé)
Utilisateur.anonyme({required this.id})
: nom = 'Anonyme',
age = 0,
email = null;
// Méthode
String sePresenter() => 'Je suis $nom, $age ans.';
// toString
@override
String toString() => 'Utilisateur(id: $id, nom: $nom)';
}
void main() {
final utilisateur1 = Utilisateur(id: '1', nom: 'John Doe', age: 30);
final utilisateur2 = Utilisateur.anonyme(id: '2');
print(utilisateur1);
print(utilisateur2);
}