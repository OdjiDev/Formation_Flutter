import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class ParametresPage extends StatefulWidget {
  const ParametresPage({super.key});

  @override
  State<ParametresPage> createState() => _ParametresPageState();
}

class _ParametresPageState extends State<ParametresPage> {
  // États locaux des paramètres
  bool _darkMode = false;
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      drawer: const MainDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(height: 10),
          const Text(
            'Interface & Apparence',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Mode Sombre'),
            subtitle: const Text('Activer le thème sombre de l\'application'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
                // Note : Pour que cela fonctionne réellement sur toute l'app,
                // il faut utiliser une gestion d'état globale (ex: Provider)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Changement de thème nécessite un State Management global')),
                );
              });
            },
          ),
          const Divider(),
          const SizedBox(height: 10),
          const Text(
            'Communication',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_active),
            title: const Text('Notifications'),
            subtitle: const Text('Recevoir les alertes académiques'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }
}