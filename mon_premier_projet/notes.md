# NOTES.md - Exploration du projet Flutter

## Structure du projet par défaut

### Widget racine
- `MyApp` (StatelessWidget)
- C'est le premier widget affiché par runApp()
- Contient MaterialApp qui configure l'application

### Widget qui gère l'état
- `MyHomePage` (StatefulWidget) + `_MyHomePageState`
- Le compteur est stocké dans `_counter`
- La méthode `_incrementCounter()` modifie l'état

### Où est défini le thème
- Dans `MaterialApp` → `theme: ThemeData(...)`
- Utilise `ColorScheme.fromSeed(seedColor: Colors.deepPurple)`

### Quelle méthode déclenche la mise à jour
- `setState(() { _counter++; })`
- Sans setState(), l'interface ne se met pas à jour

### Questions de réflexion
1. Pourquoi setState() est-il nécessaire ?
   → Pour notifier Flutter que l'état a changé et qu'il faut reconstruire l'interface.

2. Que se passe-t-il si on retire setState() ?
   → La variable change mais l'interface reste figée.

3. Pourquoi MyApp est StatelessWidget et MyHomePage StatefulWidget ?
   → MyApp ne change jamais (configuration fixe).
   → MyHomePage change (le compteur s'incrémente).