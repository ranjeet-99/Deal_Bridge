import 'package:flutter/material.dart';
import '/Screens/client_registration_screen.dart';

class ClientsScreen extends StatefulWidget{

  const ClientsScreen ({super.key});

  State<ClientsScreen> createState() => _ClientsScreenState();

}

class _ClientsScreenState extends State<ClientsScreen>{

  @override

  Widget build(BuildContext context){

  return Scaffold(

    backgroundColor: const Color(0xFFF8F9FA),

    body: SafeArea(

      child: Padding(

        padding: EdgeInsets.symmetric(horizontal: 16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children:[

            Text(

              "Clients",
              style: TextStyle(

                fontSize: 30,
                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 20),

            Container(

              height:50,

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.circular(14),

                border: Border.all(

                  color: Colors.grey.shade300,

                ),

              ),

              child: TextField(

                decoration: InputDecoration(

                  hintText:"Search Clients",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal:14),

                ),

              ),

            ),

            const SizedBox(height: 20),

            Expanded(

              child: Container(

                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),

                ),

                child: ListView(

                  children:[

                    Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical:14),

                      child: Row(

                        children:[

                       Container(

                         height: 50,
                         width: 50,

                         decoration: BoxDecoration(

                           color: Color(0xFF4F6BFF),
                           shape: BoxShape.circle,

                         ),

                         child: Center(

                           child: Text(

                             "NT",
                             style: TextStyle(

                               color: Colors.white,
                               fontWeight: FontWeight.bold,

                             ),

                           ),

                         ),

                       ),

                      const SizedBox(width: 14),

                      Expanded(

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children:[

                            const Text(

                              "Nikhil Traders",
                              style: TextStyle(

                                fontWeight: FontWeight.bold,
                                fontSize: 17,

                              ),

                            ),

                            const SizedBox(height: 3),

                          const Text(

                            "TextTiles . Mumbai",
                            style: TextStyle(

                              fontSize: 14,
                              color: Colors.grey,

                            ),

                          ),


                          ],

                        ),

                      ),

                       Container(

                         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                       decoration: BoxDecoration(

                         color: Color(0xFFEDE7FF),
                         borderRadius: BorderRadius.circular(20),

                       ),

                       child: const Text(

                         "New",
                         style: TextStyle(

                           color: Color(0xFF7B61FF),
                           fontWeight: FontWeight.w600,
                           fontSize: 12,

                         ),

                       ),

                       ),

                        ],

                      ),

                    ),

                    const Divider(height:1),

                  ],

                ),

              ),

            ),

        ],

      ),
    ),

    ),

    floatingActionButton: Padding(

      padding: const EdgeInsets.only(bottom: 70, right:5),

      child: FloatingActionButton(

        onPressed:(){

          Navigator.push(

            context,
            MaterialPageRoute(

              builder: (context) => const ClientRegistrationScreen(),

            ),

          );

        },

        backgroundColor: Color(0xFF4F6BFF),
        child: const Icon(Icons.add),

      ),

    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );

}
}