import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/pages/details.dart';
import 'package:flutter_application_2/pages/services/database.dart';
import 'package:flutter_application_2/widget/Widget_suppot.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool icecream = false,pizza = false,burger = false,salad = false;
Stream? Fooditemstream;
ontheload()async{
 Fooditemstream = await Databasemethod().getfooditem("Pizza");
 setState(() {
   
 });
}
@override
  void initState() {
   ontheload();
    super.initState();
  }
  Widget allitems(){
    return StreamBuilder(stream: Fooditemstream, builder: (context,AsyncSnapshot snapshot){
return snapshot.hasData? ListView.builder(
  padding: EdgeInsets.zero,
  itemCount: snapshot.data.docs.length,
  shrinkWrap: true,
  scrollDirection: Axis.horizontal,
  itemBuilder: (context,index){
DocumentSnapshot ds = snapshot.data.docs[index];
return  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>details(Detail: ds["detail"], image: ds["Image"], name: ds["name"], price:ds["price"],)));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                          margin: EdgeInsets.all(4),
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(ds["Image"],height: 150,width: 220,fit: BoxFit.cover,)),
                                  
                                  Text(ds["name"],style: Appwidget.boldfieldtextstyle(),),
                                  SizedBox(height: 5,),
                                  Text(ds["detail"],style: Appwidget.lightlinetextstyle(),),
                                  SizedBox(height: 5,),
                                  Text("\₹" + ds["price"],style: Appwidget.semiboldtextstyle(),),
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                        ],
                      ),
                    ),
                  );
}):CircularProgressIndicator();
    });
  }
   Widget allitemsVertical(){
    return StreamBuilder(stream: Fooditemstream, builder: (context,AsyncSnapshot snapshot){
return snapshot.hasData? ListView.builder(
  padding: EdgeInsets.zero,
  itemCount: snapshot.data.docs.length,
  shrinkWrap: true,
  scrollDirection: Axis.vertical,
  itemBuilder: (context,index){
DocumentSnapshot ds = snapshot.data.docs[index];
return  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>details(Detail: ds["detail"], image: ds["Image"], name: ds["name"], price:ds["price"],)));
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        
                                    margin: EdgeInsets.only(right: 5,bottom: 15),
                                     child: Material(
                                    
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(20),
                                       child: Container(
                                       
                                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(ds["Image"],width: 150,height: 150,fit: BoxFit.cover,)),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text(ds["name"],style: Appwidget.semiboldtextstyle(),)),
                              SizedBox(height: 5,),
                              Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text(ds["detail"],style: Appwidget.lightlinetextstyle(),)),
                               Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text("\₹" + ds["price"],style: Appwidget.semiboldtextstyle(),)),
                              SizedBox(height: 60,),
                              
                          ],
                        ),
                        
                      ],
                                        ),
                                       ),
                                     ),
                                   ),
                    ),
                  );
}):CircularProgressIndicator();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 50,left: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hyy',style: Appwidget.boldfieldtextstyle(),),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text('Delicious Food',style: Appwidget.Headlinetextstyle(),),
               Text('Discover and Get Great Food',style: Appwidget.lightlinetextstyle(),),
               SizedBox(height:20),
             Container(
              margin: EdgeInsets.only(right: 20),
              child: Showitem()),
             SizedBox(height: 30,),
           Container(
            height: 300,
            child: allitems()),
             SizedBox(height: 30,),
             
            
              allitemsVertical(),
            ],
          ),
        ),
      ),
    );
    
  }
  Widget Showitem(){
return   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: ()async{
                    burger = true;
                    icecream = false;
                    pizza = false;
                    salad = false;
                    Fooditemstream  = await Databasemethod().getfooditem("Burger");
                    setState(() {
                      
                    });
                  },
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(color: burger ?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset('images/burger.png',height: 50,width: 50,fit: BoxFit.cover,color: burger?Colors.white:Colors.black,),
                    ),
                  ),
                ),
                 GestureDetector(
                   onTap: ()async{
                    burger = false;
                    icecream = true;
                    pizza = false;
                    salad = false;
                     Fooditemstream  = await Databasemethod().getfooditem("Ice-Cream");
                    setState(() {
                      
                    });
                  },
                   child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(color: icecream ?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset('images/ice-cream_1.png',height: 50,width: 50,fit: BoxFit.cover,color: icecream?Colors.white:Colors.black,),
                    ),
                                   ),
                 ),
                   GestureDetector(
                     onTap: ()async{
                    burger = false;
                    icecream = false;
                    pizza = true;
                    salad = false;
                      Fooditemstream  = await Databasemethod().getfooditem("Pizza");
                    setState(() {
                      
                    });
                  },
                   child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                       decoration: BoxDecoration(color: pizza ?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset('images/pizza.png',height: 50,width: 50,fit: BoxFit.cover,color: pizza?Colors.white:Colors.black,),
                    ),
                                   ),
                 ),
                 GestureDetector(
                  onTap: ()async{
                    burger = false;
                    icecream = false;
                    pizza = false;
                    salad = true;
                     Fooditemstream  = await Databasemethod().getfooditem("Salad");
                    setState(() {
                      
                    });
                  },
                   child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                            decoration: BoxDecoration(color: salad?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Image.asset('images/salad.png',height: 50,width: 50,fit: BoxFit.cover, color: salad?Colors.white:Colors.black,),
                    ),
                                   ),
                 ),
              ],
             );
  }
}