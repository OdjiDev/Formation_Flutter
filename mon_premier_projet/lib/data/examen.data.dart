// lib/data/examen_data.dart

import '../models/questionQcm.dart';

class ExamenData {
  // On associe chaque titre de cours à ses questions d'examen
  static const Map<String, List<QuestionQcm>> examensParCours = {
    'Cours de complexe': [
      QuestionQcm(
        enonce: 'Quelle est la valeur de i² dans C ?',
        options: ['1', '-1', '0', 'i'],
        indexBonneReponse: 1, // La bonne réponse est '-1' (index 1)
      ),
      QuestionQcm(
        enonce: 'Quel est le module du nombre complexe z = 3 + 4i ?',
        options: ['7', '5', '12', '1'],
        indexBonneReponse: 1, // La bonne réponse est '5' (index 1)
      ),
    ],
    'Arithmetique': [
      QuestionQcm(
        enonce: 'Quel est le PGCD de 12 et 18 ?',
        options: ['2', '3', '6', '12'],
        indexBonneReponse: 2, // La bonne réponse est '6' (index 2)
      ),
      QuestionQcm(
        enonce: 'Un nombre entier est divisible par 3 si :',
        options: [
          'Il se termine par 3',
          'La somme de ses chiffres est divisible par 3',
          'Il est pair',
          'Son dernier chiffre est 9'
        ],
        indexBonneReponse: 1, // La bonne réponse est la 2ème option
      ),
    ],
    'Fonctions Numeriques': [
      QuestionQcm(
        enonce: 'Quelle est la dérivée de la fonction f(x) = x² ?',
        options: ['x', '2x', '2', 'x³ / 3'],
        indexBonneReponse: 1, // La bonne réponse est '2x' (index 1)
      ),
      QuestionQcm(
        enonce: 'Quel est le ensemble de définition de la fonction f(x) = 1/x ?',
        options: ['R', 'R*', 'R+', '[0, +inf['],
        indexBonneReponse: 1, // La bonne réponse est 'R*' (index 1)
      ),
    ],
  };
}