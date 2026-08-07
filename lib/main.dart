
import 'package:flutter/material.dart';
import 'Screens/dashboard/dashboard_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import '/Screens/dashboard/Bottom_navigation_screens/main_screen.dart';

void main(){

  runApp(const MyApp());

}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override

  Widget build(BuildContext context){

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "DealBridge",
      home: MainScreen(),

    );

  }

}
