import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/pages/admin/add_food.dart';
import 'package:flutter_application_2/widget/Widget_suppot.dart';
class homeadmin extends StatefulWidget {
  const homeadmin({super.key});

  @override
  State<homeadmin> createState() => _homeadminState();
}

class _homeadminState extends State<homeadmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Column(
          children: [
            Center(
              child: Text('Home Admin',style: Appwidget.Headlinetextstyle(),),
            ),
            SizedBox(height:50),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>add_food()));
              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(6),
                        child: Image.asset('images/food.jpg',width: 100,height: 100,fit: BoxFit.cover,),
                        ),
              SizedBox(width: 20,),
              Text('Add Food Items',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}