import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/admin/admin.dart';
import 'package:flutter_application_2/pages/admin/home_admin.dart';
import 'package:flutter_application_2/pages/bottom_nav.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/on_board.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home:Bottomnav(),
    );
  }
}