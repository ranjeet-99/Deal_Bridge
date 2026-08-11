
import 'package:flutter/material.dart';
import '/models/client_model.dart';
import 'package:email_validator/email_validator.dart';

class ClientRegistrationScreen extends StatefulWidget{

  const ClientRegistrationScreen({super.key});

  @override

State <ClientRegistrationScreen> createState() => _ClientRegistrationScreenState();

}

class _ClientRegistrationScreenState extends State<ClientRegistrationScreen>{

  final _formkey = GlobalKey<FormState>();

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

void dispose(){

  clientnameController.dispose();
  companynameController.dispose();
  mobileController.dispose();
  emailController.dispose();
  gstController.dispose();
  countryController.dispose();
  stateController.dispose();
  cityController.dispose();
  pincodeController.dispose();
  addressController.dispose();

  super.dispose();

}

void saveClient(){

  if(_formkey.currentState!.validate()){

    final client = ClientModel(

      clientName: clientnameController.text.trim(),
      companyName: companynameController.text.trim(),
      mobileNumber: mobileController.text.trim(),
      email: emailController.text.trim(),
      gstNumber: gstController.text.trim(),
      country: countryController.text.trim(),
      state: stateController.text.trim(),
      city: cityController.text.trim(),
      pincode: pincodeController.text.trim(),
      address: addressController.text.trim(),


);

    print(client.clientName);
    print(client.companyName);
    print(client.mobileNumber);

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text("Client Saved Succesfully"),

      ),

    );

  }

}

Widget build(BuildContext context){

  return Scaffold(

   body: SafeArea(

     child: SingleChildScrollView(

       child: Padding(

         padding: const EdgeInsets.all(20),

       child: Form(

         key: _formkey,

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

      TextFormField(

        controller: clientnameController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(

        hintText: "Enter Client Name",
        prefixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(

        borderRadius: BorderRadius.circular(12),

        ),

      ),

        validator: (value){

          if(value == null || value.trim().isEmpty){

            return "please enter client name";

          }

          return null;

        }

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

     TextFormField(

     controller: companynameController,
     keyboardType: TextInputType.text,
     textInputAction: TextInputAction.next,
     textCapitalization: TextCapitalization.words,

     decoration: InputDecoration(

       hintText: "Enter Company Name",
       prefixIcon: const Icon(Icons.business),
       border: OutlineInputBorder(

         borderRadius: BorderRadius.circular(12),

       ),

     ),

       validator: (value){

       if(value == null || value.trim().isEmpty){

         return "please enter Company name";

       }

       return null;

       }

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

     TextFormField(

     controller: mobileController,
     keyboardType: TextInputType.number,
     textInputAction: TextInputAction.next,
     maxLength: 10,

     decoration: InputDecoration(

       hintText: "Enter Mobile Number",
       prefixIcon: const Icon(Icons.phone),
       border: OutlineInputBorder(

         borderRadius: BorderRadius.circular(12),

       ),

     ),

      validator: (value){

       if(value == null || value.trim().isEmpty){

         return "please enter mobile number";

       }

       if(!RegExp(r'^[0-9]{10}$)').hasMatch(value.trim())){

         return "Enter a valid 10-digit mobile number";

       }

       return null;

      }

     ),

     const SizedBox(height: 20),

     Text(

     "EMAIL ",
     style: TextStyle(

      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Colors.grey,

     ),

     ),

     const SizedBox(height: 8),

     TextFormField(

       controller: emailController,
       keyboardType: TextInputType.emailAddress,
       textInputAction: TextInputAction.next,

     decoration: InputDecoration(

      hintText: "Enter Email Address",
      prefixIcon: const Icon(Icons.email),
      border: OutlineInputBorder(

       borderRadius: BorderRadius.circular(12),

      ),

     ),

     validator: (value){

         if(value == null || value.trim().isEmpty){

           return "Please enter email Address";

         }

        if(!EmailValidator.validate(value.trim())){

        return "Enter a valid Email Address";

        }

        return null;

     }

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

     TextFormField(

     controller: gstController,
     keyboardType:TextInputType.text,
     textInputAction: TextInputAction.next,
     textCapitalization: TextCapitalization.characters,

     decoration: InputDecoration(

     hintText: "Enter GST Number",
     prefixIcon: const Icon(Icons.receipt_long),
     border: OutlineInputBorder(

      borderRadius: BorderRadius.circular(12),

     ),

     ),

      validator: (value){

       if(value == null || value.trim().isEmpty){

         return "Please enter GST Number";

       }

       return null;

      }

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

     TextFormField(

     controller: countryController,
     keyboardType: TextInputType.text,
     textInputAction: TextInputAction.next,
     textCapitalization: TextCapitalization.words,

     decoration: InputDecoration(

       hintText: "Enter Country",
       prefixIcon: const Icon(Icons.people),
       border: OutlineInputBorder(

       borderRadius: BorderRadius.circular(12),

       ),

     ),

      validator:(value){

       if(value == null || value.trim().isEmpty){

         return "Please enter Country";

       }

       return null;

      }

     ),

       const SizedBox(height: 20),

       Text(

         "STATE",
         style: TextStyle(

           fontSize: 13,
           fontWeight: FontWeight.w600,
           color: Colors.grey,

         ),

       ),

     const SizedBox(height: 8),

     TextFormField(

       controller: stateController,
       keyboardType: TextInputType.text,
       textInputAction: TextInputAction.next,
       textCapitalization: TextCapitalization.words,

       decoration: InputDecoration(

         hintText:"Enter state",
         prefixIcon: Icon(Icons.map),
         border: OutlineInputBorder(

           borderRadius: BorderRadius.circular(12),

         ),

       ),

       validator: (value){

         if(value == null || value.trim().isEmpty){

           return "Please enter State";

         }

         return null;

       }

     ),

     const SizedBox(height:20),

     const Text(

       "CITY",
       style: TextStyle(

         fontSize: 13,
         fontWeight: FontWeight.w600,
         color:Colors.grey,

       ),

     ),

         SizedBox(height:8),

     TextFormField(

       controller: cityController,
       keyboardType: TextInputType.text,
       textInputAction: TextInputAction.next,
       textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(

        hintText: "Enter City",
        prefixIcon: Icon(Icons.location_city),
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(12),

        ),

      ),

       validator: (value){

         if(value == null || value.trim().isEmpty){

           return "Please enter City";

         }

       return null;

       }

     ),

      const SizedBox(height: 20),

      const Text(

        "PINCODE",
        style: TextStyle(

          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.grey,

        ),

      ),

       const SizedBox(height: 8),

       TextFormField(

         controller: pincodeController,
         keyboardType: TextInputType.number,
         textInputAction: TextInputAction.next,
         maxLength: 6,

         decoration: InputDecoration(

           hintText: "Enter Pincode",
           prefixIcon: Icon(Icons.pin_drop),
           border: OutlineInputBorder(

             borderRadius: BorderRadius.circular(12),

           ),

         ),

         validator: (value){

           if(value == null || value.trim().isEmpty){

             return "Please enter pincode";

           }

           if(!RegExp(r'^[0-9]{6}$').hasMatch(value.trim())){

            return "Enter a valid 6-digit Pincode";

           }

           return null;

         }

       ),

         const SizedBox(height:20),

       const Text(

         "ADDRESS",
         style: TextStyle(

           fontSize: 13,
           fontWeight: FontWeight.w600,
           color: Colors.grey,

         ),

       ) ,

        const SizedBox(height: 8),


       TextFormField(

         controller: addressController,
         keyboardType: TextInputType.streetAddress,
         textInputAction: TextInputAction.done,
         maxLines: 4,

         decoration: InputDecoration(

           hintText: "Enter complete Address",
           prefixIcon: Icon(Icons.home),
           border: OutlineInputBorder(

             borderRadius: BorderRadius.circular(12),

           ),

         ),

         validator: (value){

           if(value == null || value.trim().isEmpty){

             return "Please enter Address";

           }

           return null;

         }

       ),

         const SizedBox(height:30),

       SizedBox(

         width: double.infinity,
         height: 52,

         child: ElevatedButton(

           onPressed: saveClient,

           child: const Text(

             "Save Client",
             style: TextStyle(

               fontSize: 16,
               fontWeight: FontWeight.bold,

             ),

           ),

         ),

       ),

         const SizedBox(height: 20),

       ],

       ),

       ),
       ),

     ),

   ),

  );

}

}