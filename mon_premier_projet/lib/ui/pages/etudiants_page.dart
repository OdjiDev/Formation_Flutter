import 'package:flutter/material.dart';
import 'package:mon_premier_projet/ui/pages/AddEditEtudiantPage.dart';
import '../../models/etudiant.dart';
import '../../services/api_service.dart';
import '../widgets/main_drawer.dart';

class EtudiantsPage extends StatefulWidget {
  const EtudiantsPage({super.key});

  @override
  State<EtudiantsPage> createState() => _EtudiantsPageState();
}

class _EtudiantsPageState extends State<EtudiantsPage> {
  // 1. Instance du service
  final ApiService apiService = ApiService();
  
  late Future<List<Etudiant>> _futureEtudiants;

  @override
  void initState() {
    super.initState();
    _rafraichirListe();
  }

  void _rafraichirListe() {
    setState(() {
      // FIX 1 : Utilisation de l'instance `apiService` au lieu de la classe statique
      _futureEtudiants = apiService.fetchEtudiants();
    });
  }

  // Méthode de suppression sécurisée avec gestion des erreurs
  Future<void> _supprimerEtudiant(String id) async {
    try {
      // FIX 2 : Utilisation de l'instance `apiService`
      await apiService.supprimerEtudiant(id);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Étudiant supprimé avec succès'),
            backgroundColor: Colors.green,
          ),
        );
      }
      _rafraichirListe();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors de la suppression : $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Étudiants (API Spring)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _rafraichirListe,
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<List<Etudiant>>(
        future: _futureEtudiants,
        builder: (context, snapshot) {
          // 1. Indicateur de chargement
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          // 2. Gestion des erreurs HTTP/Réseau
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Impossible de contacter le serveur Spring Boot.\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          // 3. Cas de liste vide
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun étudiant retourné par l\'API.'));
          }

          final etudiants = snapshot.data!;

          // 4. Affichage de la liste
          return RefreshIndicator(
            onRefresh: () async => _rafraichirListe(),
            child: ListView.builder(
              itemCount: etudiants.length,
              itemBuilder: (context, index) {
                final e = etudiants[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(e.nomComplet),
                  subtitle: Text('${e.matricule} • ${e.filiere}'),

                   // Regroupement des deux boutons dans un Row
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                 
                  builder: (context) => AddEditEtudiantPage(etudiant: e),
                ),
              );
              if (result == true) {
                _rafraichirListe();
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _supprimerEtudiant(e.id),
          ),
        ],
      ),
    );
  },
)
             ,
          );
        },
      ),
      // 1. POSITIONNER LE BOUTON EN BAS À GAUCHE
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

  // 2. LE BOUTON FLOOTTANT "+"
  floatingActionButton: FloatingActionButton(
    onPressed: () async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddEditEtudiantPage(),
        ),
      );

      if (result == true) {
        _rafraichirListe();
      }
    },
    child: const Icon(Icons.add),
  ),
);


      
    
  }
}