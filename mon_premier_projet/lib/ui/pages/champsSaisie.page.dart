
import 'package:flutter/material.dart';

import '../widgets/drawer.widget.dart';
class ChampsSaisie extends StatelessWidget {
  const ChampsSaisie ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(
        title: Text('ChampsSaisie '),
      ),
      body: Center(
        child: Column(
          children:[
            TextFormField(),
                ],
        )

      ),
    );
  }
}
