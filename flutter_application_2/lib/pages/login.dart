import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/pages/bottom_nav.dart';
import 'package:flutter_application_2/pages/forget_password.dart';
import 'package:flutter_application_2/pages/signup.dart';
import 'package:flutter_application_2/widget/Widget_suppot.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});
  @override
  State<LogIn> createState() => _LogInState();
}
class _LogInState extends State<LogIn> {
String email = "",password = "";
final _formkey = GlobalKey<FormState>();
TextEditingController usermailcontroller = new TextEditingController();
TextEditingController userpasswordcontroller = new TextEditingController();
userlogin()async{
try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  ScaffoldMessenger.of(context).showSnackBar((SnackBar(
  backgroundColor: Colors.orangeAccent,
  content: Text('LoginSuccessfully',style: TextStyle(fontSize: 20),))));
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Bottomnav()));
}on FirebaseAuthException catch(e){
  if(e.code == 'user-not-found'){
    ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text('Not user dound that email',style: TextStyle(color: Colors.black,fontSize: 18),))));
  }else if(e.code == 'Wrong Password'){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter Correct Password',style: TextStyle(color: Colors.black,fontSize: 18),)));
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
                      height: MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(height: 30,),
                            Text("Login",style: Appwidget.Headlinetextstyle(),),
                            TextFormField(
                              controller: usermailcontroller,
                              validator: (value){
                                if(value == null ||  value.isEmpty){
                                  return 'Please enter the email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(hintText: 'Email',hintStyle:Appwidget.semiboldtextstyle(),prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(height: 20,),
                            TextFormField(
                              controller: userpasswordcontroller,
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Please Enter the Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(hintText: 'Password',hintStyle:Appwidget.semiboldtextstyle(),prefixIcon: Icon(Icons.password_outlined),),
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>Forgetpassword()));
                              },
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text("Forget Password?",style: Appwidget.semiboldtextstyle(),)),
                            ),
                              SizedBox(height: 80,),
                              GestureDetector(
                                onTap: (){
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email = usermailcontroller.text;
                                      password = userpasswordcontroller.text;
                                    });
                                  }
                                  userlogin();
                                },
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    width: 200,
                                    decoration: BoxDecoration(color: Color(0xffff5722),borderRadius: BorderRadius.circular(20)),
                                    child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize:18 ,fontFamily: 'Poppins',fontWeight: FontWeight.bold),)),
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
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Signup()));
                    },
                    child: Text("Don't have an account ? Sign Up",style: Appwidget.semiboldtextstyle(),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}