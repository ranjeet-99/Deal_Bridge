import 'package:flutter/material.dart';

class ClientsScreen extends StatefulWidget{

  const ClientsScreen ({super.key});

  State<ClientsScreen> createState() => _ClientScreenState();

}

class _ClientScreenState extends State<ClientsScreen>{

@override

  Widget build(BuildContext context){

  return Scaffold(

    body: Center(

      child: Text(

        "Clients Screen"

      ),

    ),

  );

}

}