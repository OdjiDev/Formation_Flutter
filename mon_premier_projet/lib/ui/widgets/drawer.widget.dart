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
            child: Text('Menu'),
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
        ],
      ),
    );
  }
}
