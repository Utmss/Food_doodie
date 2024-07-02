import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/widget/Widget_suppot.dart';
class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50,left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,)),
          Image.asset('images/salad2.png',width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/2.5,fit: BoxFit.fill,),
          SizedBox(height: 15,),

          Row(
            
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mediterranean',style: Appwidget.semiboldtextstyle(),),
                   Text('Chickpea Salad',style: Appwidget.boldfieldtextstyle(),),
                ],
              ),
         Spacer(),
              GestureDetector(
                onTap: (){
                  if(a>1)
                  --a;
                  setState(() {
                    
                  });
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.remove,color: Colors.white,),
                ),
              ),
              SizedBox(width: 20,),
              Text(a.toString(),style: Appwidget.semiboldtextstyle(),),
              SizedBox(width: 20,),
                GestureDetector(
                  onTap: (){
                    ++a;
                    setState(() {
                      
                    });
                  },
                  child: Container(
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.add,color: Colors.white,),
                                ),
                )
            ],
          ),
          SizedBox(height: 20,),
          Text('Salads are a versatile and healthy food option enjoyed worldwide. They typically consist of raw or cooked ingredients, such as vegetables, fruits, grains, proteins. ',maxLines:4,style:  Appwidget.lightlinetextstyle(),),
          SizedBox(height: 30),
          Row(
            children: [
              Text('Delivery time',style: Appwidget.semiboldtextstyle(),),
              SizedBox(width: 20,),
              Icon(Icons.alarm,color: Colors.black54,),
              SizedBox(width: 5,),
              Text('30 minutes',style: Appwidget.semiboldtextstyle(),),
            ],
          ),
          Spacer(),
           Padding(
             padding: const EdgeInsets.only(bottom: 40.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Delivery',style: Appwidget.semiboldtextstyle(),),
                        Text('\$28',style: Appwidget.Headlinetextstyle(),)
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/2,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Poppins',),),
                          SizedBox(width: 30,),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(8)),
                            child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                    )
                  ],
                ),
           )
      ],),
      ),
    );
  }
}