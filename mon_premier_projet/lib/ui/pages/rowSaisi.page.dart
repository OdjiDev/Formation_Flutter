import 'package:flutter/material.dart';
import 'package:mon_premier_projet/ui/widgets/drawer.widget.dart';

class Rowsaisi extends StatelessWidget{
  const Rowsaisi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
    
      appBar: AppBar(
        title: Text("Les Champs de Saisi"),
        backgroundColor: Colors.blue,
      ),
      
       body: Padding(padding: const EdgeInsets.all(16.0), // Ajoute de la marge autour
      
  
        child: 
       
        Column(
          
          children: [
            Center( child: 
       Image.asset(
                 ("assets/images/logo.png"),
                height: 120,
                fit: BoxFit.contain ,
              )
              ),
            Row(
              children: [
                Text("nom"),
                SizedBox(width: 30,),
               Expanded(child: TextField(
                  decoration: InputDecoration(
                    labelText: "Nom",
                    border: OutlineInputBorder(),
                  ),
                ))  ,
                
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Text("Prenom"),
                SizedBox(width: 16,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    labelText: "prenom",
                    border: OutlineInputBorder()
                  ),
                ))
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Text("Email"),
                SizedBox(width: 30,),
                Expanded(child: TextField(
                   decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                   ),
                ))
              ],
            )
          ],
        ),
       ),
       
    );
  }

}