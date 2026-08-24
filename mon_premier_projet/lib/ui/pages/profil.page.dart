
import 'package:flutter/material.dart';

import '../widgets/drawer.widget.dart';
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(
        title: Text('Mon profil'),
      ),
      body: Center(
        child: Text('Devopp',
          style: TextStyle(
              color: Colors.red,fontSize: 24),),
      


      ),
    );
  }
}
