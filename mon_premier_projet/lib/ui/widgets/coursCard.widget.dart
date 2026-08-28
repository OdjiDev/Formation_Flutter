import 'package:flutter/material.dart';
import '../../models/document_cours.dart';
import '../../services/fichiers.service.dart';
import '../pages/passageExamen.page.dart';
import '../pages/pdfViewer.page.dart';

class CoursCard extends StatelessWidget {
  final DocumentCours cours;

  const CoursCard({super.key, required this.cours});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: const CircleAvatar(
          backgroundColor: Colors.indigoAccent,
          child: Icon(Icons.picture_as_pdf, color: Colors.white),
        ),
        title: Text(
          cours.titre,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(cours.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bouton Télécharger
            IconButton(
              tooltip: 'Télécharger',
              icon: const Icon(Icons.download_rounded, color: Colors.green),
              onPressed: () => FichiersService.telechargerFichierAsset(
                context: context,
                nomFichier: cours.nomFichierAsset,
              ),
            ),
            // Bouton Voir PDF
            IconButton(
              tooltip: 'Voir le PDF',
              icon: const Icon(Icons.visibility, color: Colors.indigo),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerPage(
                    nomFichierAsset: cours.nomFichierAsset,
                    titreCours: cours.titre,
                  ),
                ),
              ),
            ),
            // Bouton Examen QCM
            IconButton(
              tooltip: 'Passer l\'examen',
              icon: const Icon(Icons.quiz_outlined, color: Colors.deepOrange),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PassageExamenPage(
                    titreCours: cours.titre,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}