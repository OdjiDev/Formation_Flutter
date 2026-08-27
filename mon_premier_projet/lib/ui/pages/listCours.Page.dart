import 'package:flutter/material.dart';
class Cours{
   final int  id=0 ;
   final String nom="Chimi";
   const Cours({
    required id, required nom
   });

}
class Listcours extends StatelessWidget {
   
      Listcours({super.key});
     List<Cours> cours= [
      Cours(id: 1, nom: "Mathematique"),
      Cours(id: 3, nom: "Physique"),
         
     ];

     @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text("Liste des Cours"),
      backgroundColor: Colors.green,
     ),
     body: ListView.builder(
          itemCount: cours.length,
          itemBuilder: (context, index){
           final c=cours[index];
             return ListTile(
              title: Text(c.nom),

             );


          }
           
       
      ));
    
    
    
  }
}