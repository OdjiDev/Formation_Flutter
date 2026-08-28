import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.school, size: 35, color: Colors.indigo),
                ),
                SizedBox(height: 10),
                Text(
                  'Gestion Académique',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Portail Étudiant',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Accueil'),
            onTap: () {
              // pushReplacementNamed pour éviter d'empiler les pages
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Gestion des Cours'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/cours');
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Gestion des Étudiants'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/etudiants');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Paramètres'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/parametres');
            },
          ),
          const Divider(), // Ligne de séparation
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('À Propos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/propos');
            },
          ),
           const Divider(), // Ligne de séparation
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text('counter'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/propos');
            },
          ),
            const Divider(), // Ligne de séparation
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text('Taches'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/taches');
            },
          ),
        ],
      ),
    );
  }
}