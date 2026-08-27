
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
        child: Column(
          children: [
            Image.asset(
              'assets/images/histoire.jpeg',
              fit: BoxFit.contain,
              height: 180,
            ),
            Text("Gassama"),
            SizedBox(height: 16,),
            Text("Developpeur"),
            ElevatedButton(onPressed:(){
            Navigator.pushNamed(context, "/home");
            }, child: Text("Connexion"))
          ],
        )

      ),
    );
  }
}
