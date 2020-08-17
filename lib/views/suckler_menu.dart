import 'package:flutter/material.dart';
import 'package:herdwatch/components/menu_tile.dart';

class SucklerMenu extends StatelessWidget {
  SucklerMenu();

  @override
  Widget build(BuildContext context) {
    List<MenuItem> items = new List<MenuItem>();
    items.add(MenuItem("Cows", "assets/cow.jpg","/sucklercows"));
    items.add(MenuItem("Calfs", "assets/calf.jpg","/calf"));
    items.add(MenuItem("Fields", "assets/fields.jpg","/fields"));

    //print(items.length);
    return new Container( color: Colors.white,
        child: new ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new MenuTile(items[index].name, items[index].imagePath, items[index].route);
            }));
  }
}

class MenuItem {
  String name;
  String imagePath;
  String route;

  MenuItem(String name, String imagePath,String route) {
    this.name = name;
    this.route = route;
    this.imagePath = imagePath;
  }
}
