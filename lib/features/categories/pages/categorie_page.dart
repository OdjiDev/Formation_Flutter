import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/categorie.dart';
import '../providers/categorie_notifier.dart';

class CategoriePage extends ConsumerWidget {
  const CategoriePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categorieProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion des Catégories'),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
              ? Center(child: Text(state.error!, style: const TextStyle(color: Colors.red)))
              : ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    final cat = state.categories[index];
                    return ListTile(
                      title: Text(cat.nom),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _ouvrirDialogue(context, ref, categorie: cat),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              if (cat.id != null) {
                                ref.read(categorieProvider.notifier).supprimer(cat.id!);
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _ouvrirDialogue(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _ouvrirDialogue(BuildContext context, WidgetRef ref, {Categorie? categorie}) {
    final controller = TextEditingController(text: categorie?.nom ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(categorie == null ? 'Ajouter une catégorie' : 'Modifier la catégorie'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Nom'),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              final nom = controller.text.trim();
              if (nom.isNotEmpty) {
                if (categorie == null) {
                  ref.read(categorieProvider.notifier).ajouter(nom);
                } else {
                  ref.read(categorieProvider.notifier).modifier(categorie.id!, nom);
                }
                Navigator.pop(context);
              }
            },
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}