import 'package:cloud_firestore/cloud_firestore.dart';
class Databasemethod{
  Future Addfooditem(Map<String, dynamic> userinfomap,String name)async{
    return await FirebaseFirestore.instance
    .collection(name)
    .add(userinfomap);
  }

  Future<Stream<QuerySnapshot>> getfooditem(String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
}