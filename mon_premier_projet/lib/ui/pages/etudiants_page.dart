import 'package:flutter/material.dart';
import '../../models/etudiant.dart';
import '../widgets/main_drawer.dart';

class EtudiantsPage extends StatefulWidget {
  const EtudiantsPage({super.key});

  @override
  State<EtudiantsPage> createState() => _EtudiantsPageState();
}

class _EtudiantsPageState extends State<EtudiantsPage> {
  // Liste locale pour permettre la recherche et l'ajout
  List<Etudiant> _etudiantsAffiches = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialiser avec la liste complète au démarrage
    _etudiantsAffiches = List.from(listeDesEtudiants);
  }

  // Fonction de filtrage dynamique
  void _filtrerEtudiants(String query) {
    setState(() {
      if (query.isEmpty) {
        _etudiantsAffiches = List.from(listeDesEtudiants);
      } else {
        _etudiantsAffiches = listeDesEtudiants.where((etudiant) {
          final nomComplet = etudiant.nomComplet.toLowerCase();
          final matricule = etudiant.matricule.toLowerCase();
          final searchLower = query.toLowerCase();
          return nomComplet.contains(searchLower) || matricule.contains(searchLower);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Étudiants'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          // 1. Barre de recherche
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Rechercher par nom ou matricule...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _filtrerEtudiants,
            ),
          ),
          
          // 2. Liste des étudiants filtrée
          Expanded(
            child: _etudiantsAffiches.isEmpty
                ? const Center(child: Text('Aucun étudiant trouvé.'))
                : ListView.builder(
                    itemCount: _etudiantsAffiches.length,
                    itemBuilder: (context, index) {
                      final etudiant = _etudiantsAffiches[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          child: const Icon(Icons.person, color: Colors.green),
                        ),
                        title: Text(etudiant.nomComplet),
                        subtitle: Text('${etudiant.matricule} - ${etudiant.filiere}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.email_outlined, color: Colors.indigo),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Contacter ${etudiant.email}')));
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      // Button pour ajouter un étudiant (Formulaire non inclus pour brièveté)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Formulaire d\'ajout non implémenté')));
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}