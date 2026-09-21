import 'package:dio/dio.dart';


class ApiClient {
  

  // Instance unique de Dio configurée pour Spring Boot
  // (10.0.2.2 pour l'émulateur Android, ou l'IP de ton PC pour un vrai téléphone)
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8080/api/v1',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}