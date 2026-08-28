import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FichiersService {
  static Future<void> telechargerFichierAsset({
    required BuildContext context,
    required String nomFichier,
  }) async {
    try {
      ByteData data = await rootBundle.load('assets/cours/$nomFichier');
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes, 
        data.lengthInBytes,
      );

      Directory? dossierCible;
      if (Platform.isAndroid) {
        dossierCible = Directory('/storage/emulated/0/Download');
        if (!await dossierCible.exists()) {
          dossierCible = await getExternalStorageDirectory();
        }
      } else {
        dossierCible = await getApplicationDocumentsDirectory();
      }

      if (dossierCible != null) {
        String cheminDestination = '${dossierCible.path}/$nomFichier';
        File fichierLocal = File(cheminDestination);
        await fichierLocal.writeAsBytes(bytes);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Fichier enregistré : ${fichierLocal.path}'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur : $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}