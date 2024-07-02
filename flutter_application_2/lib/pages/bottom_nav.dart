import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/order.dart';
import 'package:flutter_application_2/pages/profile.dart';
import 'package:flutter_application_2/pages/wallet.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currenttabindex = 0;
  late List<Widget> pages;
  late Widget currentpage;
  late Homepage home;
  late Profile profile;
  late Order order;
late Wallet wallet;
@override
  void initState() {
    home = Homepage();
    order = Order();
    wallet = Wallet();
    profile = Profile();
    
    pages = [home,order,wallet,profile];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar:
     
      CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(microseconds: 500),
        onTap: (int index){
          setState(() {
            currenttabindex = index;
          });
        },
        items: [
      Icon(Icons.home_outlined,color: Colors.white,),
      Icon(Icons.shopping_bag_outlined,color: Colors.white,),
      Icon(Icons.wallet_outlined,color: Colors.white,),
      Icon(Icons.person_outline,color: Colors.white,)
     ]),
     body: pages[currenttabindex],
    );
  }
}