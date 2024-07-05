import 'package:flutter/material.dart';
import 'package:flutter_application_2/widget/Widget_suppot.dart';
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(child: Text('Wallet',style: Appwidget.Headlinetextstyle(),)))),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal:10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
                  child: Row(
                    children: [
                      Image.asset('images/wallet.png',width: 60,height: 60,fit: BoxFit.cover,),
                      SizedBox(width: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your Wallet',style: Appwidget.boldfieldtextstyle()),
                          SizedBox(height:5),
                          Text('\₹' + '100',style: Appwidget.semiboldtextstyle(),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Add Money',style: Appwidget.semiboldtextstyle(),),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5),
                        
                      ),
                      child: Text('\₹' + '100',style: Appwidget.semiboldtextstyle(),),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5),
                        
                      ),
                      child: Text('\₹' + '500',style: Appwidget.semiboldtextstyle(),),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5),
                        
                      ),
                      child: Text('\₹' + '1000',style: Appwidget.semiboldtextstyle(),),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE9E2E2)),
                        borderRadius: BorderRadius.circular(5),
                        
                      ),
                      child: Text('\₹' + '2000',style: Appwidget.semiboldtextstyle(),),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF008080),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text('Add Money',style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'Poppins'),),
                  ),
                )
          ],
        ),
      ),
    );
  }
}