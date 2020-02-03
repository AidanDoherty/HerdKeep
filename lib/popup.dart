 
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return AlertDialog(
                    content: Form(
                     
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              onPressed: () { 
                                print('hello');
                               },
                              child: Text("Submitß"),
                              
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                
  }
          
}
