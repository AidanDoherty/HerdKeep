import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:herdwatch/components/custom_tile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'new_animal.dart';

class CoveredMenu extends StatelessWidget {
  CoveredMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularPercentIndicator(
              radius: 200.0,
              lineWidth: 10.0,
              percent: .5,
              center: new Text(
                "50%",
                style: TextStyle(fontSize: 20),
              ),
              progressColor: Colors.green,
            ),
            HerdList(),
          ],
        ))),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewAnimal()),
              );
            },
            tooltip: 'Increment',
            child: Icon(Icons.add)));

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class HerdList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Text("No Data")
              : Column(
                  children: <Widget>[
                    Text(snapshot.data.documents.length.toString()),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot products =
                            snapshot.data.documents[index];
                       



                        if (products['covered']!= null)
                        {
                          var date = products['covered'].split('/');
                        print(date[0]);
                        return CoveredTile(
                          products['breed'],
                          products['tag'],
                          new DateTime.utc(
                              int.parse(date[0]),
                              int.parse(date[1]),
                              int.parse(date[2])),
                        );
                        }
                        else 
                         return CoveredTile(
                          products['breed'],
                          products['tag'],
                      null,
                        );
                      },
                    ),
                  ],
                );
        });
  }
}
