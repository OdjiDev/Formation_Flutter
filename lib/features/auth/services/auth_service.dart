import '../../../core/security/api_client.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient();

  // Méthode de connexion
  Future<bool> login(String username, String password) async {
    try {
      final response = await _apiClient.dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });

      // Supposons que Spring Boot renvoie un JSON du type : {"token": "eyJhbGciOi..."}
      final token = response.data['token'];

      if (token != null) {
        await _apiClient.saveToken(token);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception("Échec de la connexion : $e");
    }
  }

  // Méthode de déconnexion
  Future<void> logout() async {
    await _apiClient.logout();
  }
}