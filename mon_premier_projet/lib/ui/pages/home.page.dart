
import 'package:flutter/material.dart';

import '../widgets/drawer.widget.dart';
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
