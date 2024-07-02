import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/pages/bottom_nav.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/login.dart';
import 'package:flutter_application_2/widget/Widget_suppot.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = "",Password = "",name  = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  registration()async{
    if(Password != null){
      try{
UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: Password);
ScaffoldMessenger.of(context).showSnackBar((SnackBar(
  backgroundColor: Colors.orangeAccent,
  content: Text('Registered Successfully',style: TextStyle(fontSize: 20),))));
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Bottomnav()));
      }on FirebaseException catch(e){
        if(e.code == 'weak-password'){
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('Password Provide is so Weak',style: TextStyle(fontSize: 18),))));
        }
        else if(e.code == 'email already registered'){
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text('Already Account exits',style: TextStyle(fontSize: 18),))));
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:[
                  Color(0xFFff5c30),Color(0xFFe74b1a)
                ] )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 60,left: 20,right: 20),
              padding: EdgeInsets.only(left:20,right: 20),
              child: Column(
                children: [
                  Center(child: Image.asset('images/logo.png',width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.cover,)),
                  SizedBox(height: 50,),
                  Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/1.8,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Text("SignUp",style: Appwidget.Headlinetextstyle(),),
                            TextFormField(
                              controller: namecontroller,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Please enter a name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(hintText: 'Name',hintStyle:Appwidget.semiboldtextstyle(),prefixIcon: Icon(Icons.person)),
                            ),
                              SizedBox(height: 20,),
                            TextFormField(
                              controller: mailcontroller,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'please enter a email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(hintText: 'Email',hintStyle:Appwidget.semiboldtextstyle(),prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              controller: passwordcontroller,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return ' please enter a Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(hintText: 'Password',hintStyle:Appwidget.semiboldtextstyle(),prefixIcon: Icon(Icons.password_outlined),),
                            ),
                           
                              SizedBox(height: 80,),
                              GestureDetector(
                                onTap: ()async{
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email = mailcontroller.text;
                                      name = namecontroller.text;
                                      Password = passwordcontroller.text;
                                    });
                                  }
                                  registration();
                                },
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    width: 200,
                                    decoration: BoxDecoration(color: Color(0xffff5722),borderRadius: BorderRadius.circular(20)),
                                    child: Center(child: Text("SIGNUP",style: TextStyle(color: Colors.white,fontSize:18 ,fontFamily: 'Poppins',fontWeight: FontWeight.bold),)),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 70,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                    },
                    child: Text("Already have an account? Login",style: Appwidget.semiboldtextstyle(),))
                ],
              ),
            )
          ],
        ),
      ),
    );;
  }
}