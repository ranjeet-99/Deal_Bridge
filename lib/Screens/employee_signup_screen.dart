import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import "dart:convert";

import 'package:http/http.dart' as http;

class EmployeeSignupScreen extends StatefulWidget{

  const EmployeeSignupScreen ({super.key});

  @override
  State<EmployeeSignupScreen> createState() => _EmployeeSignupScreenState();

}

class _EmployeeSignupScreenState extends State<EmployeeSignupScreen>{

final _formkey = GlobalKey<FormState>();

final TextEditingController fullnameController = TextEditingController();
final TextEditingController employeeidController = TextEditingController();
final TextEditingController companyNameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController mobilenumberController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmpasswordController = TextEditingController();

bool ispasswordvisible = false;
bool isconfirmpasswordvisible = false;
bool isregistering = false;

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

              if(value == null || value.trim().isEmpty){

                return "please enter your FullName";

              }

              return null;

             }

           ),

              const SizedBox(height: 20),

           TextFormField(

             controller: employeeidController,
             keyboardType: TextInputType.text,
             textInputAction: TextInputAction.next,

             decoration: InputDecoration(

               labelText: "Employee ID",
               hintText: "enter your employee id (optional)",
               prefixIcon: const Icon(Icons.badge_outlined),
               border: OutlineInputBorder(

                 borderRadius: BorderRadius.circular(12),

               ),


             ),


           ),

              const SizedBox(height: 20),

              TextFormField(

                controller: companyNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,

                decoration: InputDecoration(

                  labelText: "Company",
                  hintText:"enter Company name ",
                  prefixIcon: const Icon(Icons.factory_outlined),

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),

                  ),

                ),

              ),

              TextFormField(

                controller: emailController,
                keyboardType:  TextInputType.emailAddress,
                textInputAction: TextInputAction.next,

                decoration:InputDecoration(

                  labelText: "Email",
                  hintText:"enter your Email",
                  prefixIcon: const Icon(Icons.email_outlined),

                  border: OutlineInputBorder(

                   borderRadius: BorderRadius.circular(12),

                  ),

                ),

              validator: (value){

                  if(value == null || value.trim().isEmpty){

                    return "please enter your email";

                  }

                  if(!EmailValidator.validate(value.trim())){

                    return "please enter the valid Email";

                  }

                  return null;

              }

              ),

              const SizedBox(height: 20),

              TextFormField(

                controller: mobilenumberController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                maxLength: 10,

                decoration: InputDecoration(

                labelText: "Phone Number",
                hintText: "enter your Phone Number",
                prefixIcon:const Icon(Icons.phone_outlined),

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(12),

                ),

                  counterText: "",

                ),

                validator: (value){

                  if(value == null || value.trim().isEmpty){

                    return "please enter your phone number";

                  }

                  if(value.length !=  10){

                    return "mobile number must be 10 digits";

                  }

                  return null;

                }

              ),

              const SizedBox(height: 20),

              TextFormField(

                controller: passwordController,
                obscureText: !ispasswordvisible,
                textInputAction: TextInputAction.next,

                decoration: InputDecoration (

                labelText: "Password",
                hintText: "enter your password",
                prefixIcon: const Icon(Icons.lock_outlined),

                suffixIcon: IconButton(

                  onPressed: (){

                    setState((){

                      ispasswordvisible = !ispasswordvisible;


                    });

                  },

                  icon: Icon(

                  ispasswordvisible ? Icons.visibility
                                    : Icons.visibility_off,

                ),

                ),

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),

                  ),

                ),

                validator: (value){

                  if(value == null || value.trim().isEmpty){

                    return "please enter your password";

                  }

                  if(value.length < 8){

                   return "password must be atlease 8 characters";

                  }

                  return null;

                }

              ),

              const SizedBox(height: 12),

              TextFormField(

                controller: confirmpasswordController,
                obscureText: !isconfirmpasswordvisible,
                textInputAction: TextInputAction.next,

                decoration: InputDecoration(

                  labelText: "Confirm Password",
                  hintText: "Re-Enter your password",
                  prefixIcon: const Icon(Icons.lock_outlined),

                  suffixIcon: IconButton(

                    onPressed:(){

                      setState((){

                        isconfirmpasswordvisible = !isconfirmpasswordvisible;

                      });

                    },

                    icon: Icon(

                      isconfirmpasswordvisible ? Icons.visibility
                                               : Icons.visibility_off,

                    ),

                  ),

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),

                  ),

                ),

                validator: (value){

                  if(value == null || value.trim().isEmpty){

                    return "please Re-Enter your password";

                  }

                  if(value != passwordController.text){

                    return "password do not match";

                  }

                  return null;

                }

              ),

              const SizedBox(height: 30),

              SizedBox(

                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  onPressed: isregistering ? null : () async {

                    if(_formkey.currentState!.validate()){

                      setState((){

                        isregistering = true;

                      });

                      final url = Uri.parse("http://192.168.2.220:3000/api/auth/register",);

                      print("BEFORE API REQUEST");

                      final response = await http.post(

                         url,

                      headers:{

                        "Content-Type":"application/json" ,

                      },

                      body: jsonEncode({

                     "name": fullnameController.text.trim(),
                      "employee_id": employeeidController.text.trim(),
                      "company_name": companyNameController.text.trim(),
                      "number": mobilenumberController.text.trim(),
                      "email": emailController.text.trim(),
                      "password": passwordController.text.trim(),
                      "confirm_password": confirmpasswordController.text.trim(),

                      }),

                      );

                      if(response.statusCode == 201){

                        print("registration Successful");

                        if (!mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(

                          const SnackBar(

                            content: Text("Registration Successful"),

                          ),

                        );

                        await Future.delayed(const Duration (milliseconds: 500));

                        if(!mounted) return;

                     //   Navigator.pop(context);

                      }
                      else{

                       final data = jsonDecode(response.body);

                       if (!mounted) return;

                       ScaffoldMessenger.of(context).showSnackBar(

                          SnackBar(

                           content: Text(data["message"] ?? "Registration Failed"),

                         ),

                       );

                      }

                      if(mounted){

                        setState((){

                          isregistering = false;

                        });

                      }

                    }

                   ScaffoldMessenger.of(context).showSnackBar(

                     const SnackBar(

                       content:Text("Employee Account Created Succesfully"),

                       backgroundColor: Colors.green,


                     ),

                   );


                   Navigator.pop(context);

                  },

                 child: isregistering ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ) : const Text(

                    "Create Account",
                    style: TextStyle(

                      fontSize: 16,
                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ),

              ),

              const SizedBox(height: 20),

              Row(

                mainAxisAlignment: MainAxisAlignment.center,

               children:[

                 const Text(

                   "already have an Account?"

                 ),

                 TextButton(

                   onPressed:(){

                     Navigator.pop(context);

                   },

                   child: const Text(

                     "Login"

                 ),

                 ),

               ]

              ),

            ],

          ),


          ),

        ),

      ),

    );

  }

}