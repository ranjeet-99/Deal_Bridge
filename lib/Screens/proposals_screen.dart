import 'package:flutter/material.dart';

class ProposalScreen extends StatefulWidget{

  const ProposalScreen ({super.key});

  State<ProposalScreen> createState() => _ProposalScreenState();

}

class _ProposalScreenState extends State<ProposalScreen>{

  @override

  Widget build(BuildContext context){

    return Scaffold(


      body: Center(

        child: Text(

          "Proposal Screen "

        ),

      ),

    );

  }

}