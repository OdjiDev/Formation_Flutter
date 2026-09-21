import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/categorie.dart';
import '../services/categorie_service.dart';

class CategorieState {
  final List<Categorie> categories;
  final bool isLoading;
  final String? error;

  CategorieState({
    this.categories = const [],
    this.isLoading = false,
    this.error,
  });

  CategorieState copyWith({
    List<Categorie>? categories,
    bool? isLoading,
    String? error,
  }) {
    return CategorieState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class CategorieNotifier extends Notifier<CategorieState> {
  final CategorieService _service = CategorieService();

  @override
  CategorieState build() {
    chargerCategories();
    return CategorieState(isLoading: true);
  }

  Future<void> chargerCategories() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final resultat = await _service.getCategories();
      state = state.copyWith(categories: resultat, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> ajouter(String nom) async {
    try {
      await _service.ajouterCategorie(Categorie(nom: nom));
      await chargerCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> modifier(int id, String nom) async {
    try {
      await _service.modifierCategorie(id, Categorie(id: id, nom: nom));
      await chargerCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> supprimer(int id) async {
    try {
      await _service.supprimerCategorie(id);
      await chargerCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

final categorieProvider = NotifierProvider<CategorieNotifier, CategorieState>(() {
  return CategorieNotifier();
});