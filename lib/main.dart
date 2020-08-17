import 'package:flutter/material.dart';
import 'package:herdwatch/views/calfs.dart';
import 'package:herdwatch/views/covered_cows.dart';
import 'package:herdwatch/views/fields.dart';
import 'package:herdwatch/views/main_menu.dart';
import 'package:herdwatch/views/suckler_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herd Keep',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Herd Keep 🐄'),
           routes: {
        
        '/sucklercows': (context) => CoveredMenu(),
        '/calf': (context) => Calf(),
        '/fields': (context) => Fields()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body:Align(alignment: Alignment.center, child: MainMenu()));
  }
}


