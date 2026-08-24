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
            title: Text('Home'),

            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context,"/home");
            },
          ),
          ListTile(
            title: Text('Meteo'),
          onTap: () {

              Navigator.of(context).pop();
              Navigator.pushNamed(context,"/meteo");
            },
          ),
           ListTile(
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
    title: Text('listeCours'),
    onTap: () {

    Navigator.of(context).pop();
    Navigator.pushNamed(context,"/listeCours");
    },
    ),
        ListTile(
          title: Text('Quitter'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
    );
  }
} 