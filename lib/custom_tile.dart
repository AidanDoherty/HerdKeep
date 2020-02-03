import 'package:flutter/material.dart';

class CustTile extends StatelessWidget {
  final String breed;
  final DateTime date;
  final String smalltag;
  final String bigTag;

  CustTile(this.breed, this.date, this.smalltag, this.bigTag);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: Column(children: [
        Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
            child: Icon(Icons.account_circle),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,0,0,0),
            child: new Text(
              this.breed,
              style: new TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 5, 0),
            child: new Text(getDateString(this.date),
                style: new TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 0, 5, 0),
            child: new  Text(returnlastthree(this.bigTag), style: new TextStyle(fontSize: 20)),
          )
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(280, 0, 5, 0),
          child: new Text(this.smalltag),
        ),
      ]),
    );
  }
}

String getDateString(DateTime date) {
  return date.day.toString() + '/' + date.month.toString();
}

String returnlastthree(String inputString)
{
  List<String> elements = inputString.split("");
  int max = elements.length;
  return elements[max-3].toString()  + elements[max-2].toString() + elements[max-1].toString();
}
