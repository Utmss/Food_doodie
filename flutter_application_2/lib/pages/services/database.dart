import 'package:cloud_firestore/cloud_firestore.dart';
class Databasemethod{
  Future adduserdetail(Map<String, dynamic> userinfomap,String id)async{
    return await FirebaseFirestore.instance
    .collection("users")
    .doc(id)
    .set(userinfomap);
  }
  Future Addfooditem(Map<String, dynamic> userinfomap,String name)async{
    return await FirebaseFirestore.instance
    .collection(name)
    .add(userinfomap);
  }

  Future<Stream<QuerySnapshot>> getfooditem(String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
  }
 Future addfoodTocart(Map<String, dynamic> userinfomap,String id)async{
    return await FirebaseFirestore.instance
    .collection("users")
    .doc(id)
    .collection("Cart")
    .add(userinfomap);
  }

}