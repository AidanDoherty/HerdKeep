import 'package:flutter/material.dart';

import 'package:herdwatch/views/suckler_menu.dart';

class MainMenu extends StatelessWidget {
  MainMenu();

  @override
  Widget build(BuildContext context) {
    double cheight = (MediaQuery.of(context).size.height / 2) - 50;
    double cwidth = MediaQuery.of(context).size.width / 2;
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SucklerMenu()),
                );
              },
              child: Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/sucklerfarming.png'),
                    Text("Suckler Farming"),
                  ],
                )),
                height: cheight,
                width: cwidth,
              ),
            ),
            Container(color: Colors.blue, height: cheight, width: cwidth)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(color: Colors.blue, height: cheight, width: cwidth),
            Container(
              color: Colors.red,
              height: cheight,
              width: cwidth,
            )
          ])
        ]));
  }
}
