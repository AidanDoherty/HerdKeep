import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class NewAnimal extends StatelessWidget {
  DateTime selectedDate = DateTime.now();
  DateTime dob = DateTime.now();
  TextEditingController tagNumberController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController breedController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  final firestoreInstance = Firestore.instance;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) selectedDate = picked;
  }

  @override
  Widget build(BuildContext context) {
       final key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key:key,
      appBar: AppBar(
        title: Text("Add new animal"),
      ),
      body: Column(
        children: <Widget>[
          new ListTile(
            leading: const Icon(Icons.confirmation_number),
            title: new TextField(
              controller: tagNumberController,
              decoration: new InputDecoration(
                hintText: "Tag Number",
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () async {
                String cameraScanResult = await scanner.scan();
                tagNumberController.text = cameraScanResult;
                //print(cameraScanResult);
              },
            ),
          ),
          new ListTile(
              leading: Text("🧬"),
              title: new TextField(
                controller: breedController,
                decoration: new InputDecoration(
                  hintText: "Breed",
                ),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () async {
                    String cameraScanResult = await scanner.scan();
                    //print(cameraScanResult);
                    // dob
                    //print(cameraScanResult.substring(0, 8));
                    String dob =
                        "${cameraScanResult.substring(0, 2)}-${cameraScanResult.substring(2, 4)}-${cameraScanResult.substring(4, 8)}";
                    dobController.text = cameraScanResult.substring(0, 8);
                    //print(dob);
                    // Gender
                 
                    //allow for cross or full breed
                    if (cameraScanResult.length == 11) {
                      //print(cameraScanResult.substring(9, 11));

                      breedController.text = cameraScanResult.substring(9, 11);
                    } else {
                       //print(cameraScanResult.substring(9, 12));

                    breedController.text = cameraScanResult.substring(9, 12);
                    }
                    //print(cameraScanResult.substring(8, 9));
                    genderController.text = cameraScanResult.substring(8, 9);
                    //Breed
                  })),
          new ListTile(
            leading: Text("♀️♂️"),
            title: new TextField(
              controller: genderController,
              decoration: new InputDecoration(
                hintText: "Gender",
              ),
            ),
          ),
          new ListTile(
            leading: Icon(Icons.calendar_today),
            title: new TextField(
              controller: dobController,
              onTap: () => _selectDate(context),
              decoration: new InputDecoration(
                hintText: "${selectedDate.toLocal()}".split(' ')[0],
              ),
            ),
          ),
          new ListTile(
            leading: Text("⚖️"),
            title: new TextField(
              controller: weightController,
              decoration: new InputDecoration(
                hintText: "Weight in kilos",
              ),
            ),
          ),
          new RaisedButton(
            onPressed: () => {
              firestoreInstance
                  .collection("users")
                  .document("${tagNumberController.text}")
                  .setData({
                "tag": '${tagNumberController.text}',
                "breed": '${breedController.text}',
                "gender": '${genderController.text}',
                "dob": '${dobController.text}',
                "weight": '${weightController.text}',
              }).then((_) {
                 key.currentState.showSnackBar(new SnackBar(
                content: new Text("Animal added successfully!"),
               
              ));
              Navigator.pop(context);
              })
            },
            child: Text("Add new Animal"),
          )
        ],
      ),
    );
  }
}
