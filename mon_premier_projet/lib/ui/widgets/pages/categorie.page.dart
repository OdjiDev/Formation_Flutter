import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'modele.dart';
import 'drawer.widget.dart';
import 'categorie.notifier.dart';

class CategoriePage extends ConsumerWidget {
  const CategoriePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On écoute l'état global du provider
    final categorieState = ref.watch(categorieProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Catégories - Riverpod & Dio'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.read(categorieProvider.notifier).chargerCategories(),
          ),
        ],
      ),
      body: _buildBody(context, ref, categorieState),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _afficherBoiteDialogue(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, CategorieState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            state.error!,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (state.categories.isEmpty) {
      return const Center(child: Text('Aucune catégorie disponible.'));
    }

    return ListView.builder(
      itemCount: state.categories.length,
      itemBuilder: (context, index) {
        final cat = state.categories[index];
        return ListTile(
          leading: CircleAvatar(child: Text('${cat.id ?? index}')),
          title: Text(cat.nom),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () => _afficherBoiteDialogue(context, ref, categorieExistante: cat),
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
    );
  }

  void _afficherBoiteDialogue(BuildContext context, WidgetRef ref, {Categorie? categorieExistante}) {
    final textController = TextEditingController(text: categorieExistante?.nom ?? '');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(categorieExistante == null ? 'Ajouter une catégorie' : 'Modifier la catégorie'),
          content: TextField(
            controller: textController,
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
                final nom = textController.text.trim();
                if (nom.isNotEmpty) {
                  if (categorieExistante == null) {
                    ref.read(categorieProvider.notifier).ajouter(nom);
                  } else {
                    ref.read(categorieProvider.notifier).modifier(categorieExistante.id!, nom);
                  }
                  Navigator.pop(context);
                }
              },
              child: const Text('Enregistrer'),
            ),
          ],
        );
      },
    );
  }
}