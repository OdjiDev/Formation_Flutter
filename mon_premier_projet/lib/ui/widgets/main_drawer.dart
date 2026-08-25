import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // En-tête du Drawer avec style violet / indigo
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
                  child: Icon(
                    Icons.school,
                    size: 35,
                    color: Colors.indigo,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Portail Académique',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Gestion & Suivi',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Éléments du menu
          
          
          ListTile(
            leading: const Icon(Icons.people, color: Colors.indigo),
            title: const Text('Étudiants'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/etudiants');
            },
          ),
          
          
           ListTile(
            leading: const Icon(Icons.add, color: Colors.indigo),
            title: const Text('ajouter etudiant'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/addEtudiant');
            },
           ),
           ListTile(
            leading: const Icon(Icons.edit, color: Colors.indigo),
            title: const Text('modifier etudiant'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/editEtudiant');
            },
          ),
        ],
      ),
    );
  }
}