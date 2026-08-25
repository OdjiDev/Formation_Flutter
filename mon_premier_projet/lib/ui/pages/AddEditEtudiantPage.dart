import 'package:flutter/material.dart';
import '../../models/etudiant.dart';
import '../../services/api_service.dart';

class AddEditEtudiantPage extends StatefulWidget {
  final Etudiant? etudiant; // Null = Ajout | Non-null = Modification

  const AddEditEtudiantPage({super.key, this.etudiant});

  @override
  State<AddEditEtudiantPage> createState() => _AddEditEtudiantPageState();
}

class _AddEditEtudiantPageState extends State<AddEditEtudiantPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _matriculeController = TextEditingController();
  final _emailController = TextEditingController(); 
  final _filiereController = TextEditingController();

  final ApiService _etudiantService = ApiService();
  bool _isLoading = false;

  bool get _isEditing => widget.etudiant != null;

  @override
  void initState() {
    super.initState();
    // Si on est en mode édition, pré-remplir les champs avec les données existantes
    if (_isEditing) {
      _nomController.text = widget.etudiant!.nom;
      _prenomController.text = widget.etudiant!.prenom;
      _matriculeController.text = widget.etudiant!.matricule;
      _filiereController.text = widget.etudiant!.filiere;
    }
  }

  @override
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _matriculeController.dispose();
    _filiereController.dispose();
    super.dispose();
  }

  Future<void> _sauvegarder() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final etudiantData = Etudiant(
        id: _isEditing ? widget.etudiant!.id : DateTime.now().millisecondsSinceEpoch.toString(),
        nom: _nomController.text.trim(),
        prenom: _prenomController.text.trim(),
        matricule: _matriculeController.text.trim(),
        email: _emailController.text.trim(),
        filiere: _filiereController.text.trim(),
      );

      if (_isEditing) {
        // Appeler la méthode d'UPDATE
        await _etudiantService.modifierEtudiant(widget.etudiant!.id, etudiantData);
      } else {
        // Appeler la méthode d'ADD
        await _etudiantService.ajouterEtudiant(etudiantData);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_isEditing ? 'Étudiant modifié avec succès !' : 'Étudiant ajouté avec succès !'),
          ),
        );
        Navigator.pop(context, true); // Renvoie true pour rafraîchir la liste
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
      appBar: AppBar(
        title: Text(_isEditing ? 'Modifier l\'Étudiant' : 'Ajouter un Étudiant'),
      ),
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
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _sauvegarder,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(_isEditing ? 'Mettre à jour' : 'Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}