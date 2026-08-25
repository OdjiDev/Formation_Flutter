import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/etudiant.dart';

class ApiService {
  final String baseUrl;
  final http.Client client;
  static const Duration _timeoutDuration = Duration(seconds: 10);

  static const Map<String, String> _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  // Injection du client HTTP (facilite les tests unitaires avec MockClient)
  ApiService({
    this.baseUrl = 'http://localhost:8080/api',//Web
    //this.baseUrl = 'http://10.0.2.2:8080/api',//EMULATEUR
    http.Client? client,
  }) : client = client ?? http.Client();

  // --- READ ---
  Future<List<Etudiant>> fetchEtudiants() async {
    return _guardedRequest(() async {
      final response = await client
          .get(Uri.parse('$baseUrl/etudiants'), headers: _headers)
          .timeout(_timeoutDuration);

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(utf8.decode(response.bodyBytes));
        return body.map((item) => Etudiant.fromJson(item)).toList();
      }
      throw Exception('Erreur serveur (${response.statusCode})');
    }, 'la récupération des étudiants');
  }

  // --- CREATE ---
  Future<Etudiant> ajouterEtudiant(Etudiant etudiant) async {
    return _guardedRequest(() async {
      final response = await client
          .post(
            Uri.parse('$baseUrl/etudiants'),
            headers: _headers,
            body: jsonEncode(etudiant.toJson()),
          )
          .timeout(_timeoutDuration);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return Etudiant.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }
      throw Exception('Échec de la création (${response.statusCode})');
    }, 'l\'ajout de l\'étudiant');
  }

  // --- UPDATE ---
Future<Etudiant> modifierEtudiant(String id, Etudiant etudiant) async {
    return _guardedRequest(() async {
      final response = await client
          .put(
            Uri.parse('$baseUrl/etudiants/$id'),
            headers: _headers,
            body: jsonEncode(etudiant.toJson()),
          )
          .timeout(_timeoutDuration);

      if (response.statusCode == 200) {
        return Etudiant.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }
      throw Exception('Échec de la modification (${response.statusCode})');
    }, 'la modification');
  }

  // --- DELETE ---
  Future<void> supprimerEtudiant(String id) async {
    return _guardedRequest(() async {
      final response = await client
          .delete(
            Uri.parse('$baseUrl/etudiants/$id'),
            headers: _headers,
          )
          .timeout(_timeoutDuration);

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Échec de la suppression (${response.statusCode})');
      }
    }, 'la suppression');
  }

  // --- FACTORISATION DE LA GESTION DES ERREURS RESEAU ---
  Future<T> _guardedRequest<T>(Future<T> Function() action, String contextMessage) async {
    try {
      return await action();
    } on SocketException {
      throw Exception('Impossible de contacter le serveur Spring Boot. Vérifiez la connexion.');
    } on TimeoutException {
      throw Exception('Délai d\'attente dépassé lors de $contextMessage.');
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Erreur inattendue lors de $contextMessage : $e');
    }
  }
}
