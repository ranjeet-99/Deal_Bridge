import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override

  void initState(){

    super.initState();

    Timer(

      const Duration(seconds: 3),
        (){

        Navigator.pushReplacement(

          context,

          MaterialPageRoute(

            builder: (context) => const LoginScreen(),

          )

        );

    },

    );

  }

  Widget build(BuildContext context){

    return Scaffold(

      backgroundColor: Colors.white,

      body:Center(

        child: Column(

          mainAxisAlignment:MainAxisAlignment.center,

          children:[

            Icon(

              Icons.handshake_rounded,
              size: 90,
              color: Colors.blue,

            ),

            SizedBox(height: 20),

            Text(

              "DealBridge",
              style: TextStyle(

              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,

            ),
            ),

            SizedBox(height: 8),

            Text(

              "Client . Visit . Proposal",
              style: TextStyle(

                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 40),

            CircularProgressIndicator(),

          ],

        ),

      ),

    );

  }

}