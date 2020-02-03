import 'package:flutter/material.dart';
import 'package:herdwatch/animals.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'custom_tile.dart';
import 'listofcows.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Herd Keep 🐄' ),
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
  String _counter = "";

  Future<void> _incrementCounter() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      _counter = cameraScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body:   SingleChildScrollView( child:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularPercentIndicator(
                  radius: 200.0,
                  lineWidth: 10.0,
                  percent: .5,
                  center: new Text("50%",style: TextStyle(fontSize: 20),),
                  progressColor: Colors.green,
                ),
            HerdList()],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
  }
}

class HerdList extends StatelessWidget {
  List<String> litems = ["1", "2", "Third", "4"];
  List<Cow> cows = [
    Cow("0000087", DateTime(2017,9,7) , DateTime.now(), "CHX"),
    Cow("0000085", DateTime(2017,20,10) , DateTime.now(), "LMX"),
    Cow("0000087", DateTime(2017,9,7) , DateTime.now(), "CHX"),
    Cow("0000085", DateTime(2017,20,10) , DateTime.now(), "LMX"),
    Cow("0000087", DateTime(2017,9,7) , DateTime.now(), "CHX"),
    Cow("0000085", DateTime(2017,20,10) , DateTime.now(), "LMX"),
     Cow("0000087", DateTime(2017,9,7) , DateTime.now(), "CHX"),
    Cow("0000085", DateTime(2017,20,10) , DateTime.now(), "LMX"),
    Cow("0000087", DateTime(2017,9,7) , DateTime.now(), "CHX"),
    Cow("0000085", DateTime(2017,20,10) , DateTime.now(), "LMX"),
    Cow("0000087", DateTime(2017,9,7) , DateTime.now(), "CHX"),
    Cow("0000085", DateTime(2017,20,10) , DateTime.now(), "LMX")
  
  
  ];
  
 
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 400, // Change as per your requirement
        width:  MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: cows.length,
            itemBuilder: (BuildContext context, int index) {
              return 

              CustTile(cows[index].breed ,cows[index].covered,cows[index].tag,cows[index].tag );
            }
        )
    );
  }
}

printIssue() {
  print("there has been an issue,");
}


