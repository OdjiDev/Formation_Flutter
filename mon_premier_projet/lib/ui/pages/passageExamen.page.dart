// lib/views/pages/passage_examen_page.dart

import 'package:flutter/material.dart';
import '../../data/examen.data.dart';
import '../../models/questionQcm.dart';

class PassageExamenPage extends StatefulWidget {
  final String titreCours;

  const PassageExamenPage({super.key, required this.titreCours});

  @override
  State<PassageExamenPage> createState() => _PassageExamenPageState();
}

class _PassageExamenPageState extends State<PassageExamenPage> {
  int _indexQuestionActuelle = 0;
  int? _indexOptionSelectionnee;
  int _score = 0;
  bool _examenTermine = false;

  @override
  Widget build(BuildContext context) {
    // Récupération des questions correspondant au cours sélectionné
    final List<QuestionQcm>? questions = ExamenData.examensParCours[widget.titreCours];

    // Vérification si le cours possède des questions
    if (questions == null || questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.titreCours),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Text('Aucun examen disponible pour ce cours.'),
        ),
      );
    }

    // Affichage de l'écran des résultats quand l'examen est fini
    if (_examenTermine) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Résultat de l\'examen'),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.stars_rounded, size: 90, color: Colors.indigo),
                const SizedBox(height: 16),
                const Text(
                  'Évaluation terminée !',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  'Votre score : $_score / ${questions.length}',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: _score >= (questions.length / 2) ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Retourner aux cours'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final questionCourante = questions[_indexQuestionActuelle];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.titreCours} (${_indexQuestionActuelle + 1}/${questions.length})'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Énoncé de la question
            Card(
              color: Colors.indigo.shade50,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  questionCourante.enonce,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Liste des choix de réponse
            Expanded(
              child: ListView.builder(
                itemCount: questionCourante.options.length,
                itemBuilder: (context, index) {
                  final estChoisi = _indexOptionSelectionnee == index;
                  return Card(
                    elevation: estChoisi ? 3 : 1,
                    color: estChoisi ? Colors.indigo.shade50 : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: estChoisi ? Colors.indigo : Colors.grey.shade300,
                        width: estChoisi ? 2 : 1,
                      ),
                    ),
                    child: ListTile(
                      title: Text(questionCourante.options[index]),
                      leading: CircleAvatar(
                        backgroundColor: estChoisi ? Colors.indigo : Colors.grey.shade200,
                        foregroundColor: estChoisi ? Colors.white : Colors.black87,
                        child: Text('${index + 1}'),
                      ),
                      onTap: () {
                        setState(() {
                          _indexOptionSelectionnee = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            // Bouton de validation
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: _indexOptionSelectionnee == null
                    ? null // Bouton désactivé si aucune réponse sélectionnée
                    : () {
                        // Vérifier la réponse
                        if (_indexOptionSelectionnee == questionCourante.indexBonneReponse) {
                          _score++;
                        }

                        // Passer à la question suivante ou terminer
                        if (_indexQuestionActuelle + 1 < questions.length) {
                          setState(() {
                            _indexQuestionActuelle++;
                            _indexOptionSelectionnee = null;
                          });
                        } else {
                          setState(() {
                            _examenTermine = true;
                          });
                        }
                      },
                child: Text(
                  _indexQuestionActuelle + 1 == questions.length
                      ? 'Terminer l\'examen'
                      : 'Question suivante',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}