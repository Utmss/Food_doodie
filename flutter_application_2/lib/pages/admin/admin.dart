import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/pages/admin/home_admin.dart';
class adminlogin extends StatefulWidget {
  const adminlogin({super.key});

  @override
  State<adminlogin> createState() => _adminloginState();
}

class _adminloginState extends State<adminlogin> {
  final GlobalKey<FormState> _formkey  = GlobalKey<FormState>();
  TextEditingController usercontroller = new TextEditingController();
   TextEditingController userpasswordcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
            padding: EdgeInsets.only(top: 45,left: 20,right: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 53, 51  , 51),Colors.black,],begin: Alignment.topLeft,end: Alignment.topRight,
            
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(MediaQuery.of(context).size.width, 110),
            )
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 30,right: 20,top: 60),
              child: Form(key:_formkey ,child: Column(

                children: [
                  Text("Let's Start with\n admin",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height/2.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(children: [
                        SizedBox(height: 50,),
                        Container(
                          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 160, 160, 147)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              controller: usercontroller,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return ' Please Enter a username';
                                }
                                return null;
                              },
                              decoration: InputDecoration(border: InputBorder.none,
                               hintText: 'Username',
                              hintStyle: TextStyle(color: Color.fromARGB(255, 160, 160, 147))
                              ),
                              ),
                          ),
                        ),
                        SizedBox(height: 20,),
                         Container(
                          padding: EdgeInsets.only(left: 20,top: 5,bottom: 5),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color.fromARGB(255, 160, 160, 147)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextFormField(
                              obscureText: true,
                              controller:  userpasswordcontroller,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return ' Please Enter a Password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Color.fromARGB(255, 160, 160, 147))
                              ),
                              ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        GestureDetector(
                          onTap: (){
                            Loginadmin();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text('Login',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                          
                          ),
                        )
                      ],),
                    ),
                  )
                ],
              )),
          )
        ],
      ),
    );
  }
  Loginadmin(){
    FirebaseFirestore.instance.collection('Admin').get().then((snapshot) {
snapshot.docs.forEach((result) {
if(result.data()['id'] != usercontroller.text.trim()){
   ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('Your Id is not correct',style: TextStyle(fontSize: 18),))));
}
else if(result.data()['Password'] != userpasswordcontroller.text.trim()){
   ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('Your password is not correct',style: TextStyle(fontSize: 18),))));
}
else{
  Route route = MaterialPageRoute(builder: (context)=>homeadmin());
  Navigator.pushReplacement(context,route);
}
 });
    });
  }
}