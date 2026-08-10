import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientRegistrationScreen extends StatefulWidget{

  const ClientRegistrationScreen({super.key});

  @override

State <ClientRegistrationScreen> createState() => _ClientRegistrationScreenState();

}

class _ClientRegistrationScreenState extends State<ClientRegistrationScreen>{

 final clientnameController = TextEditingController();
 final companynameController = TextEditingController();
 final mobileController = TextEditingController();
 final emailController = TextEditingController();
 final gstController = TextEditingController();
 final countryController = TextEditingController();
 final stateController = TextEditingController();
 final cityController = TextEditingController();
 final pincodeController = TextEditingController();
 final addressController = TextEditingController();

@override

Widget build(BuildContext context){

  return Scaffold(

   body: SafeArea(

     child: SingleChildScrollView(

       child: Padding(

         padding: const EdgeInsets.all(20),

       child: Column(

         crossAxisAlignment: CrossAxisAlignment.start,

       children:[

         const Text(

           "New Client Registration",
           style: TextStyle(

             fontSize: 24,
             fontWeight: FontWeight.bold,

           ),

         ),

         const SizedBox(height: 24),

         const Text(

           "CLIENT NAME",
           style: TextStyle(

             fontSize: 13,
             fontWeight: FontWeight.w600,
             color: Colors.grey,

           ),

         ),

       const SizedBox(height: 8),

      TextField(

        controller: clientnameController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,

      decoration: InputDecoration(

        hintText: "Enter Client Name",
        border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(12),

        ),

      ),

      ),

        const SizedBox(height: 20),

      Text(

          "COMPANY NAME",
        style: TextStyle(

          fontSize: 13,
          fontWeight: FontWeight.w600,
          color:Colors.grey,

        ),

      ),

     const SizedBox(height:8),

     TextField(

     controller: companynameController,
     keyboardType: TextInputType.text,
     textInputAction: TextInputAction.next,

     decoration: InputDecoration(

       hintText: "Enter Company Name",

       border: OutlineInputBorder(

         borderRadius: BorderRadius.circular(12),

       ),

     ),


     ),

     const SizedBox(height: 20),

     Text(

       "MOBILE NUMBER",
       style: TextStyle(

        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.grey,

       ),

     ),

     const SizedBox(height: 8),

     TextField(

     controller: mobileController,
     keyboardType: TextInputType.number,
     textInputAction: TextInputAction.next,
     maxLength: 10,

     decoration: InputDecoration(

       hintText: "Enter Mobile Number",
       border: OutlineInputBorder(

         borderRadius: BorderRadius.circular(12),

       ),

     ),

     ),

     const SizedBox(height: 20),

     Text(

     "EMAIL ADDRESS",
     style: TextStyle(

      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.grey,

     ),

     ),

     const SizedBox(height: 8),

     TextField(

       controller: emailController,
       keyboardType: TextInputType.emailAddress,
       textInputAction: TextInputAction.next,

     decoration: InputDecoration(

      hintText: "Enter your Email",
      border: OutlineInputBorder(

       borderRadius: BorderRadius.circular(12),

      ),

     ),

     ),

     const SizedBox(height:20),

     Text(

       "GST NUMBER",
       style: TextStyle(

         fontSize: 13,
         fontWeight: FontWeight.w600,
         color: Colors.grey,

       ),
     ),

     const SizedBox(height: 8),

     TextField(

     controller: gstController,
     keyboardType:TextInputType.text,
     textInputAction: TextInputAction.next,

     decoration: InputDecoration(

     hintText: "Enter GST Number",
     border: OutlineInputBorder(

      borderRadius: BorderRadius.circular(12),

     ),

     ),

     ),

     const SizedBox(height: 20),

     Text(

      "COUNTRY",
      style: TextStyle(

        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),

     ),

     const SizedBox(height: 8),

     TextField(

     controller: countryController,
     keyboardType: TextInputType.text,
     textInputAction: TextInputAction.next,

     decoration: InputDecoration(

       hintText: "Enter Country",
       border: OutlineInputBorder(

       borderRadius: BorderRadius.circular(12),

       ),

     ),

     ),

     const SizedBox(height:20),

       ],

       ),

       ),

     ),

   ),

  );

}

}