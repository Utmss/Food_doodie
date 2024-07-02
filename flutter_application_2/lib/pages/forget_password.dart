import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/pages/signup.dart';
class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  TextEditingController maileditingcontroller = new TextEditingController();
  String email = "";
  final _formkey = GlobalKey<FormState>();
resetpassword()async{
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Reset Email has been sent ! ',style: TextStyle(fontSize: 18),)));
  }on FirebaseAuthException catch(e){
    if(e.code == 'User-not-found'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Not user Found',style: TextStyle(fontSize: 18),)));
    }
  }
}

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70,),
            Container(
              alignment: Alignment.topCenter,
              child: Text("Password Recovery",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold
              ),),
            ),
            SizedBox(height: 10,),
            Text('Enter Your Email',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,)),
            Expanded(child: Form(
              key: _formkey,
              child: Padding(padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white70,width: 2.0),
                      borderRadius: BorderRadius.circular(30)
                    ),
                  child:  TextFormField(
                    controller: maileditingcontroller,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Your Email';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 18,color: Colors.white),
                      prefixIcon: Icon(Icons.person,color: Colors.white70,size: 30,),
                      border: InputBorder.none,
                    ),
                    
                  )
                  ),
                  SizedBox(height: 40,),
                  
                    
                       GestureDetector(
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              email = maileditingcontroller.text;
                            });
                            resetpassword();
                          }

                        },
                         child: Container(
                            width: 140,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text('Send Email',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          ),
                       ),
                        SizedBox(height: 50,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(" Don't have an acoount",style: TextStyle(color: Colors.white,fontSize: 18),),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                  },
                  child: Text('Create',style: TextStyle(color: Color.fromARGB(225, 184, 166, 6),fontSize: 20,fontWeight: FontWeight.w500),))
              ],
            )
                      ],
                    ),
                  )
            )
            ),
           
           
          ],
        ),
      ),
    );
  }
}