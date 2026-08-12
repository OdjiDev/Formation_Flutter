
import 'package:flutter/material.dart';

import '../widgets/drawer.widget.dart';
class MeteoPage extends StatelessWidget {
  const MeteoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(
        title: Text('Météo'),
      ),
      body: const Center(
        child: Text('Hello, Meteo!',
          style: TextStyle(
              color: Colors.red,fontSize: 24),),

      ),
    );
  }
}
