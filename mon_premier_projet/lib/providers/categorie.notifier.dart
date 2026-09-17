import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'modele.dart';
import 'categorie_service.dart';

// Classe d'état global pour gérer les données et les erreurs proprement
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

// Le Notifier Riverpod
class CategorieNotifier extends Notifier<CategorieState> {
  final CategorieService _service = CategorieService();

  @override
  CategorieState build() {
    chargerCategories(); // Charge les données automatiquement au démarrage
    return CategorieState(isLoading: true);
  }

  // Lire (GET)
  Future<void> chargerCategories() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final resultat = await _service.getCategories();
      state = state.copyWith(categories: resultat, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // Créer (POST)
  Future<void> ajouter(String nom) async {
    try {
      final nouvelleCat = Categorie(nom: nom);
      await _service.ajouterCategorie(nouvelleCat);
      await chargerCategories(); // Recharge la liste depuis le serveur
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  // Modifier (PUT)
  Future<void> modifier(int id, String nouveauNom) async {
    try {
      final catModifiee = Categorie(id: id, nom: nouveauNom);
      await _service.modifierCategorie(id, catModifiee);
      await chargerCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  // Supprimer (DELETE)
  Future<void> supprimer(int id) async {
    try {
      await _service.supprimerCategorie(id);
      await chargerCategories();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}

// Le Provider global accessible partout
final categorieProvider = NotifierProvider<CategorieNotifier, CategorieState>(() {
  return CategorieNotifier();
});