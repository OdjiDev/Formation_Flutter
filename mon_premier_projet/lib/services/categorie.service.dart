import 'package:dio/dio.dart';
import 'package:mon_premier_projet/models/categorie.model.dart';

class CategorieService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8080/api/v1',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  // READ (GET)
  Future<List<Categorie>> getCategories() async {
    try {
      final response = await _dio.get('/categories');
      List<dynamic> data = response.data;
      return data.map((json) => Categorie.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Erreur lors de la récupération : $e");
    }
  }

  // CREATE (POST)
  Future<void> ajouterCategorie(Categorie categorie) async {
    try {
      await _dio.post('/categories', data: categorie.toJson());
    } catch (e) {
      throw Exception("Erreur lors de l'ajout : $e");
    }
  }

  // UPDATE (PUT)
  Future<void> modifierCategorie(int id, Categorie categorie) async {
    try {
      await _dio.put('/categories/$id', data: categorie.toJson());
    } catch (e) {
      throw Exception("Erreur lors de la modification : $e");
    }
  }

  // DELETE (DELETE)
  Future<void> supprimerCategorie(int id) async {
    try {
      await _dio.delete('/categories/$id');
    } catch (e) {
      throw Exception("Erreur lors de la suppression : $e");
    }
  }
}