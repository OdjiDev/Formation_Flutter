import '../../../core/security/api_client.dart';
import '../models/categorie.dart';

class CategorieService {
  // On utilise l'instance centralisée de Dio avec la sécurité
  final ApiClient _apiClient = ApiClient();

  Future<List<Categorie>> getCategories() async {
    try {
      final response = await _apiClient.dio.get('/categories');
      List<dynamic> data = response.data;
      return data.map((json) => Categorie.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Erreur de récupération : $e");
    }
  }

  Future<void> ajouterCategorie(Categorie categorie) async {
    try {
      await _apiClient.dio.post('/categories', data: categorie.toJson());
    } catch (e) {
      throw Exception("Erreur d'ajout : $e");
    }
  }

  Future<void> modifierCategorie(int id, Categorie categorie) async {
    try {
      await _apiClient.dio.put('/categories/$id', data: categorie.toJson());
    } catch (e) {
      throw Exception("Erreur de modification : $e");
    }
  }

  Future<void> supprimerCategorie(int id) async {
    try {
      await _apiClient.dio.delete('/categories/$id');
    } catch (e) {
      throw Exception("Erreur de suppression : $e");
    }
  }
}