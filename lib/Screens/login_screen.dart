import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget{

  const LoginScreen({super.key});

  @override

  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen>{

  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool ispasswordhidden = true;
  bool isLoading = false;

  @override

  Widget build(BuildContext context){

    return Scaffold(

      backgroundColor: const Color(0xffF5F6FC),

      body: SafeArea(

        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal : 20),

          child: Form(

            key: _formkey,

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,

            children:[

              const SizedBox(height: 40),

              Container(

                height: 60,
                width: 60,

                decoration: BoxDecoration(

                  color: const Color (0xFFF0EBFF),
                  borderRadius: BorderRadius.circular(16),

                ),

                child: const Center(

                  child: Icon(

                    Icons.lock,
                    color: Color(0xFF5B32C4),
                    size: 30,

                  ),

                ),

              ),

              const SizedBox(height: 24),

              const Text(

                "Welcome Back",

                style: TextStyle(

                  fontSize: 28,
                  fontWeight: FontWeight.bold,

                ),
              ),

              const SizedBox(height: 8),

               const Text(

                 "Login to manage your clients and deals",
                 style: TextStyle(

                   fontSize: 15,
                   color: Colors.grey,

                 ),

               ),

              const SizedBox(height: 30),

              const Text(

                "Email",

                style: TextStyle(

                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,

                ),
              ),

              const SizedBox(height:8),

              TextFormField(

                controller: emailController,
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(

                hintText:'enter your email ',
                 prefixIcon: const Icon(Icons.person_outline),
                 filled: true,
                 fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,

                  ),

                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(

                      color: Color(0xFFE3E2F2),

                    ),

                  ),

                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(

                    color: Color(0xFF1E8FE1),
                    width: 2,

                    ),

                  ),

                ),

                validator: (value){

                  if(value == null || value.isEmpty){

                    return "please enter your email ";

                  }

                  if(!EmailValidator.validate(value.trim())){

                    return "please enter the valid email";

                  }

                }

              ),

              const SizedBox(height: 20),

              Text(

                "Password",
                style: TextStyle(

                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,

                ),

              ),

              const SizedBox(height: 8),

              TextFormField(

                controller: passwordController,

                obscureText: ispasswordhidden,

                decoration: InputDecoration(

                  hintText:"enter your password",
                  prefixIcon: Icon(Icons.lock_outline),

                  suffixIcon: IconButton(

                    onPressed:(){

                    setState((){

                      ispasswordhidden = !ispasswordhidden;

                    });

                    },

                    icon: Icon(

                      ispasswordhidden ? Icons.visibility_off
                                       : Icons.visibility,

                    ),

                    ),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,

                  ),

                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(

                      color: Color(0xFFE3E2F2),

                    ),

                  ),

                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(

                      color: Color(0xFF1E8FE1),

                    ),

                  ),

                  ),

                validator: (value){

                  if(value == null || value.isEmpty){

                    return "please enter your password";

                  }

                  if(value.length < 6 ){

                    return "Password must be atleast 6 Characters";

                  }

                  return null;

                }

                ),

              const SizedBox(height: 12),

              Align(

                alignment: Alignment.centerRight,

                child: TextButton(

                  onPressed:(){

                  },

                  child: Text("Forgot Password?"),


                ),

              ),

              const SizedBox(height: 20),

              SizedBox(

                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  onPressed: isLoading
                     ? null
                     : () async{

                    if(_formkey.currentState!.validate()){

                      setState((){

                     isLoading = true;

                    });

                      // TODO: Laravel API call

                      await Future.delayed(

                        const Duration(seconds: 2),

                      );

                      setState((){

                        isLoading = false;

                      });

                      ScaffoldMessenger.of(context).showSnackBar(

                        const SnackBar(

                          content: Text("Login Succesful"),

                        ),

                      );

                   }

                  },

                  child: isLoading
                        ? const SizedBox(

                          height: 22,
                          width: 22,
                    child: CircularProgressIndicator(

                      strokeWidth: 2.5,
                      color: Colors.white,

                    ),

                          )


                  :const Text(
                    "LOGIN",
                    style: TextStyle(

                      fontSize: 16,

                    ),

                ),

                ),

              ),

            ],

          ),

          ),

        ),

      ),


    );

  }

}