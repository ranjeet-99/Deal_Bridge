import 'package:flutter/material.dart';

class EmployeeSignupScreen extends StatefulWidget{

  const EmployeeSignupScreen ({super.key});

  @override
  State<EmployeeSignupScreen> createState() => _EmployeeSignupScreenState();

}

class _EmployeeSignupScreenState extends State<EmployeeSignupScreen>{

final _formkey = GlobalKey<FormState>();

final TextEditingController fullnameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController mobilenumberController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmpasswordController = TextEditingController();

bool ispasswordvisible = false;
bool isconfirmpassword = false;

  @override

  Widget build(BuildContext context){

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Form(

           key: _formkey,

          child: Column(

            children: [

              const SizedBox(height: 60),

              const Icon(

                Icons.handshake_rounded,
                size: 90,
                color: Colors.blue,

              ),

              const SizedBox(height: 20),

              const Text(

                "DealBridge",
                style: TextStyle(

                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,

                ),

              ),

              SizedBox(height: 10),

              const Text(

                "Create Employee Account",
                style: TextStyle(

                  fontSize: 22,
                  fontWeight: FontWeight.w600,

                ),

              ),

              const SizedBox(height: 8),

            const Text(

              "Create your Employee Account to continue",
              style: TextStyle(

                color: Colors.grey,
                fontSize: 15,

              ),

            ),

           const SizedBox(height: 35),

           TextFormField(

            controller: fullnameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,

            decoration: InputDecoration(

              labelText: "Full Name",
              hintText: "enter your full name",
              prefixIcon: const Icon(Icons.person_outline),

              border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(12),

              ),

            ),

             validator: (value){

              if(value == null || value.isEmpty){

                return "please enter your FullName";

              }

              return null;

             }

           ),

              const SizedBox(height: 20),

            ],

          ),


          ),

        ),

      ),

    );

  }

}