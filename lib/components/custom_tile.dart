import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:age/age.dart';

class CoveredTile extends StatelessWidget {
   DateTime selectedDate = DateTime.now();
  final String breed;
  final String bigTag;
  final DateTime coveredDate;
  final firestoreInstance = Firestore.instance;
  CoveredTile(this.breed, this.bigTag, this.coveredDate);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) selectedDate = picked;
    firestoreInstance
                  .collection("users")
                  .document("${this.bigTag}")
                  .updateData({
                "covered": '${picked.year}/${picked.month}/${picked.day}',
            
              });
  }



  @override
  Widget build(BuildContext context) {
    // // Find out your age
    // age = Age.dateDifference(
    //     fromDate: this.date, toDate: today, includeToDate: false);

    DateTime duedate;
    String timeRemaing;

    if (this.coveredDate != null){

     duedate = this.coveredDate.add(new Duration(days:283 ) ); 
     timeRemaing  = Age.dateDifference(fromDate:this.coveredDate, toDate:duedate, includeToDate:false).days.toString();
    
     print(duedate.difference( new DateTime.now()).inDays);
    }
    return new Card(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
              child: Icon(Icons.account_circle),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: new Text(
                this.breed,
                style: new TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
              child: new Text(returnlastthree(this.bigTag),
                  style: new TextStyle(fontSize: 20)),
            ),
            this.coveredDate == null
                ? Padding(
                    padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                    child: RaisedButton(
                      child: Text("Add Date"),
                      onPressed:() {_selectDate(context);},
                    ),
                  )
                : Row(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(80, 0, 5, 0),
                        child: new Text(
                            "${this.coveredDate.day} / ${this.coveredDate.month} / ${this.coveredDate.year}"),
                      ),
                         Icon(Icons.edit),
                       
                          Text("${duedate.difference( new DateTime.now()).inDays}")
                         
                      
                  ],
                ),
         
          ]),
        ),
      ]),
    );
  }
}

String getDateString(DateTime date) {
  // print(date);
  return date.day.toString() +
      '/' +
      date.month.toString() +
      '/' +
      date.year.toString();
}

String returnlastthree(String inputString) {
  List<String> elements = inputString.split("");
  int max = elements.length;
  return elements[max - 3].toString() +
      elements[max - 2].toString() +
      elements[max - 1].toString();
}
