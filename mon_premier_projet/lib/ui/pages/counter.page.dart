

import 'package:flutter/material.dart';

import '../widgets/drawer.widget.dart';
class CounterPage extends StatefulWidget {

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Text('counter value  => ${counter}',
          style: TextStyle(
              color: Colors.red,fontSize: 24),),

      ),

    floatingActionButton: Row(
      //crossAxisAlignment: CrossAxisAlignment.end,// Align the buttons to the bottom
     // mainAxisAlignment: MainAxisAlignment.end, // Align the buttons to the right

      children: [
        FloatingActionButton (
          onPressed: (){
            setState(() {
              counter++;
            });
            print('counter value  => $counter');
          },
          child: Icon(Icons.add),
        ),
       SizedBox(width: 10,),
        FloatingActionButton (
          onPressed: (){
            setState(() {
              counter--;
            });
            print('counter value  => $counter');
          },
          child: Icon(Icons.remove),
        ),
      ]
    ),
    );
  }
    
      
}
