3.3 Modifier progressivement
Modification 1 : Changer la couleur du thème

dart
// Dans MaterialApp
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),  // Changé de deepPurple à teal
  useMaterial3: true,
),
→ Hot reload : la couleur de l'AppBar change instantanément.

Modification 2 : Changer le texte du bouton

dart
// Dans le body
const Text('Nombre de clics :'),  // Changé de 'You have pushed...'
Modification 3 : Changer le titre de l'AppBar

dart
// Dans MyHomePage
title: Text('Mon Super Compteur'),  // Changé du titre par défaut
Modification 4 : Ajouter un bouton pour décrémenter

dart
// Dans _MyHomePageState, ajouter la méthode :
void _decrementCounter() {
  setState(() {
    if (_counter > 0) _counter--;
  });
}

// Dans le body, sous le compteur, ajouter :
const SizedBox(height: 20),
ElevatedButton(
  onPressed: _decrementCounter,
  child: const Text('-'),
),
ÉTAPE 4 : POUSSER LES MODIFICATIONS
powershell
# Dans le dossier exploration
git init
git add .
git commit -m "TP2 - Exploration du projet Flutter"

# Dans le dossier catalogue_produits (fil rouge)
cd Z:\dev\fluter\catalogue_produits
git add .
git commit -m "Module 0 - Configuration initiale"
git push
RÉSUMÉ DES COMMANDES UTILES
Commande	Action
flutter --version	Version de Flutter
flutter doctor	Diagnostic complet
flutter devices	Appareils disponibles
flutter create nom	Créer un projet
flutter run	Lancer l'application
r (dans le terminal)	Hot reload
R (dans le terminal)	Hot restart
git init	Initialiser Git
git add .	Ajouter les fichiers
git commit -m "message"	Valider les modifications
git push	Envoyer sur GitHub