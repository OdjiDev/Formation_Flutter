import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  final String nomFichierAsset;
  final String titreCours;

  const PdfViewerPage({
    super.key,
    required this.nomFichierAsset,
    required this.titreCours,
  });

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? _cheminTemporaire;
  bool _estEnChargement = true;

  @override
  void initState() {
    super.initState();
    _preparerPdf();
  }

  // Copie temporaire nécessaire pour permettre à flutter_pdfview de lire le fichier
  Future<void> _preparerPdf() async {
    try {
      final byteData = await rootBundle.load('assets/cours/${widget.nomFichierAsset}');
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/${widget.nomFichierAsset}');

      await tempFile.writeAsBytes(
        byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );

      setState(() {
        _cheminTemporaire = tempFile.path;
        _estEnChargement = false;
      });
    } catch (e) {
      setState(() {
        _estEnChargement = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titreCours),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: _estEnChargement
          ? const Center(child: CircularProgressIndicator())
          : _cheminTemporaire != null
              ? PDFView(filePath: _cheminTemporaire)
              : const Center(child: Text('Erreur d\'ouverture du fichier PDF.')),
    );
  }
}