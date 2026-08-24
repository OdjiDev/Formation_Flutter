import 'package:flutter/material.dart';
import '../../models/cours.dart';
import '../../models/etudiant.dart';
import '../widgets/main_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil Académique'),
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Bannière de Bienvenue
            Card(
              color: Colors.indigo.shade50,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(Icons.school, size: 60, color: Colors.indigo),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bienvenue !',
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Gérez vos cours et étudiants en toute simplicité.',
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // 2. Section Statistiques
            const Text(
              'Aperçu Général',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    title: 'Cours',
                    value: '${listeDesCours.length}',
                    icon: Icons.book_online,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _buildStatCard(
                    context,
                    title: 'Étudiants',
                    value: '${listeDesEtudiants.length}',
                    icon: Icons.people_outline,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // 3. Section Accès Rapide
            const Text(
              'Actions Rapides',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.library_add, color: Colors.indigo),
              title: const Text('Consulter le programme'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/cours'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person_add_alt, color: Colors.indigo),
              title: const Text('Inscrire un étudiant'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/etudiants'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget utilitaire pour construire une carte de statistique
  Widget _buildStatCard(BuildContext context,
      {required String title, required String value, required IconData icon, required Color color}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}