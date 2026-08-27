import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child:Center(
              child:CircleAvatar(
                backgroundImage: AssetImage("assets/images/logo.png"),
                radius: 40,
            )
            ),
            //child: Text('Menu'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home' ),

            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context,"/home");
            },
          ),
          ListTile(
             leading: Icon(Icons.settings,color: Colors.blue,),
            title: Text('Meteo'),
            onTap: () {

              Navigator.of(context).pop();
              Navigator.pushNamed(context,"/meteo");
            },
          ),
           ListTile(
             leading: Icon(Icons.home),
            title: Text('counter'),
            onTap: () {

              Navigator.of(context).pop();
              Navigator.pushNamed(context,"/counter");
            },
          ),
    ListTile(
    title: Text('Saisie'),
    onTap: () {

    Navigator.of(context).pop();
    Navigator.pushNamed(context,"/saisie");
    },
    ),
    ListTile(
    title: Text('profil'),
    onTap: () {

    Navigator.of(context).pop();
    Navigator.pushNamed(context,"/profil");
    },
    ),
    ListTile(
      
      title: Text("RowSaisi"),
      onTap: (){
        Navigator.pushNamed(context, "/rowSaisi");
      }
    ),
    ListTile(
      title: Text("cours"),
      onTap: () {
        Navigator.pushNamed(context, "/listCours");
      },
    )
    ],
      ),
    );
  }
}
