import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService{

final CollectionReference database = Firestore.instance.collection('user1');

Stream<QuerySnapshot> get cows{
  return database.snapshots();
}
}