import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey, // Color.fromARGB(255, 97, 104, 110),
        useMaterial3: false, //Il est true par defaut sur la version recente de fluteur
        
      ),  
      home:HomePage(),
    );
  }
  
}
class HomePage extends StatelessWidget {
    const HomePage({super.key});

    @override

    Widget build(BuildContext context) {
      return Scaffold(
        drawer:MyDrawer(),
        appBar: AppBar(
          title: Text('home'),
        ),
        body: const Center(
          child: Text('Hello, World!',
          style: TextStyle(
            color: Colors.red,fontSize: 24),),
        
        ),
      );
    }
}
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
            title: Text('Item 1'),
            onTap: () {
              // Handle item 1 tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item 2 tap
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}