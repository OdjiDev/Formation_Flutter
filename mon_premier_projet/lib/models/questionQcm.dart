// lib/models/question_qcm.dart

class QuestionQcm {
  final String enonce;
  final List<String> options;
  final int indexBonneReponse; // 0 pour le 1er choix, 1 pour le 2ème, etc.

  const QuestionQcm({
    required this.enonce,
    required this.options,
    required this.indexBonneReponse,
  });
}