import 'package:flutter/material.dart';
// Importez vos fichiers Model et Service ici
import '../../models/etudiant.dart';
import '../../services/api_service.dart';

class AddEtudiantPageSetState extends StatefulWidget {
  const AddEtudiantPageSetState({super.key});

  @override
  State<AddEtudiantPageSetState> createState() => _AddEtudiantPageSetStateState();
}

class _AddEtudiantPageSetStateState extends State<AddEtudiantPageSetState> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _matriculeController = TextEditingController();
  final _filiereController = TextEditingController();
  final _emailController = TextEditingController();

  // Instanciation directe du service
  final ApiService _apiService = ApiService();

  bool _isLoading = false;

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _matriculeController.dispose();
    _filiereController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sauvegarder() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      // Instanciation directe du Model
      final nouvelEtudiant = Etudiant(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        nom: _nomController.text.trim(),
        prenom: _prenomController.text.trim(),
        matricule: _matriculeController.text.trim(),
        filiere: _filiereController.text.trim(),
        email: _emailController.text.trim(),
      );

      // Appel direct au Service
      await _apiService.ajouterEtudiant(nouvelEtudiant);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Étudiant ajouté avec succès !')),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erreur : $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un Étudiant')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (v) => v == null || v.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _prenomController,
                decoration: const InputDecoration(labelText: 'Prénom'),
                validator: (v) => v == null || v.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _matriculeController,
                decoration: const InputDecoration(labelText: 'Matricule'),
                validator: (v) => v == null || v.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _filiereController,
                decoration: const InputDecoration(labelText: 'Filière'),
                validator: (v) => v == null || v.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) => v == null || v.isEmpty ? 'Champ requis' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _sauvegarder,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}