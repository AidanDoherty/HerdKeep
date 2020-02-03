import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: MyButton()
    );
  }
}

class MyButton extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return 
    ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            );
  }
}