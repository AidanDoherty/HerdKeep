import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:herdwatch/views/covered_cows.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final String route;

  MenuTile(this.title, this.imagePath,this.route);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: InkWell(
        onTap: () {
        Navigator.pushNamed(context, this.route);
        },
        child: Container(
          child: Card(
            child: Column(children: <Widget>[
              Image.asset(this.imagePath, width: 200, height: 200),
              Text(this.title)
            ]),
          ),
        ),
      ),
    );
  }
}
