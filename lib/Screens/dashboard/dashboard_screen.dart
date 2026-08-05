import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'flutter/material.dart';

class EmployeeDashboardScreen extends StatefulWidget{

  const EmployeeDashboardScreen({super.key});

  @override

  State<EmployeeDashboardScreen> createState() => _EmployeeDeshboardScreenState();
}

class _EmployeeDeshboardScreenState extends State<EmployeeDashboardScreen>{

  @override

  Widget build(BuildContext context){

    return Scaffold(

      body:SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(20),

        child: Column(

          children:[

           Row(

             children:[

               RichText(

                 text: const TextSpan(

                   children:[

                     TextSpan(

                       text:"Deal",
                       style: TextStyle(

                         fontSize: 32,
                         fontWeight: FontWeight.bold,
                         color: Colors.blue,

                       ),
                     ),

                     TextSpan(

                       text:"Bridge",
                       style: TextStyle(

                         fontSize: 32,
                         fontWeight: FontWeight.bold,
                         color: Colors.deepPurple,

                       ),

                     ),


                   ],

                 ),

               ),

               const Spacer(),

               Stack(

                 children:[

                   IconButton(

                     onPressed:(){

                     },

                     icon: const Icon(
                         Icons.notifications_none,
                         size: 30,

                     ),

                   ),

                   Positioned(

                     right: 8,
                     top: 8,

                     child: Container(

                       padding: const EdgeInsets.all(4),

                       decoration: const BoxDecoration(

                         color: Colors.red,
                         shape: BoxShape.circle,

                       ),

                       child: const Text(

                         "4",
                         style: TextStyle(

                           fontSize: 10,
                           color: Colors.white,
                           fontWeight: FontWeight.bold,

                         ),

                       ),

                     ),

                   ),

                 ],

               ),

             ],

           ),

            const SizedBox(height:20),

          const Text(

            "GoodMorning👋",
            style: TextStyle(

              fontSize: 18,
              color: Colors.grey,

            ),

          ),

            const SizedBox(height: 5),

            const Text(

              "Ranjeet",
              style: TextStyle(

                fontSize: 28,
                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height:25),

            TextField(

              decoration: InputDecoration(

                hintText: "Search Client",
                prefixIcon:const Icon(

                  Icons.search,

                ),

                filled: true,
                fillColor: Colors.grey.shade200,

                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15),

                  borderSide: BorderSide.none,

                ),

              ),

            ),

            const SizedBox(height:25),

            Expanded(

              child: GridView.count(

                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.1,


                children:[

                  Container(

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius: BorderRadius.circular(15),

                      boxShadow:[

                        BoxShadow(

                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0,4),

                        ),

                      ],

                    ),

                    child: InkWell(

                      borderRadius: BorderRadius.circular(15),

                      onTap:(){


                      },

                 child: Column(

                   mainAxisAlignment: MainAxisAlignment.center,

                   children:[

                     Icon(

                       Icons.people,
                       size: 45,
                       color: Colors.blue,

                     ),

                     SizedBox(height:12),

                     Text(

                       "Clients",
                       style: TextStyle(

                         fontSize: 18,
                         fontWeight: FontWeight.bold,

                       ),

                     ),

                   ],

                 ),

                    ),

                  ),

                  Container(

                    decoration: BoxDecoration(

                      color: Colors.white,

                      borderRadius: BorderRadius.circular(15),

                      boxShadow:[

                        BoxShadow(

                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0,4),

                        ),

                      ],

                    ),

                   child: InkWell(

                     borderRadius: BorderRadius.circular(15),

                      onTap: (){


                    },

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children:[

                        Icon(

                          Icons.description,
                          color: Colors.orange,
                          size:45,

                        ),

                        SizedBox(height:12),

                        Text(

                          "Proposals",
                          style: TextStyle(

                            fontSize: 18,
                            fontWeight: FontWeight.bold,

                          ),

                        ),

                      ],

                    ),


                    ),

                  ),

                Container(

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(15),

                    boxShadow:[

                      BoxShadow(

                        color: Colors.black12,
                        blurRadius: 8,
                        offset: const Offset(0,4),

                      ),

                    ],

                  ),

                 child: InkWell(

                   borderRadius: BorderRadius.circular(15),

                    onTap:(){


                    },

                   child: Column(

                     mainAxisAlignment: MainAxisAlignment.center,

                     children:[

                       Icon(

                         Icons.handshake_outlined,
                         size: 45,
                         color: Colors.green,

                       ),

                     SizedBox(height: 12),

                       Text(

                         "Agreements",
                         style: TextStyle(

                           fontSize:18,
                           fontWeight: FontWeight.bold,

                         ),

                       ),

                     ],

                   ),

                  ),

                ),

              Container(

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(15),

                  boxShadow:[

                    BoxShadow(

                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0,4),

                    ),

                  ],

                ),

                child: InkWell(

                  borderRadius:BorderRadius.circular(15),

                  onTap:(){


                  },

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children:[

                      Icon(

                        Icons.location_history,
                        size: 45,
                        color: Colors.red,

                      ),

                      SizedBox(height:12),

                      Text(

                        "Visit History",
                        style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.bold,

                        ),
                      ),

                    ],

                  ),

                ),

              ),

              Container(

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(15),

                  boxShadow:[

                    BoxShadow(

                      color:Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0,4),

                    ),

                  ],

                ),

                child: InkWell(

                  borderRadius: BorderRadius.circular(12),

                  onTap:(){


                  },

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children:[

                      Icon(

                        Icons.bar_chart,
                        size: 45,
                        color: Colors.purple,

                      ),

                      SizedBox(height: 12),

                      Text(

                        "Reports",
                        style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.bold,

                        ),

                      ),

                    ],

                  ),

                ),

              ),

              Container(

                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(15),

                  boxShadow:[

                    BoxShadow(

                      color: Colors.black12,
                      blurRadius: 8,
                      offset: const Offset(0,4),

                    ),

                  ],

                ),

                child: InkWell(

                  borderRadius: BorderRadius.circular(12),

                  onTap:(){

                  },

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children:[

                      Icon(

                        Icons.person,
                        size: 45,
                        color: Colors.teal,

                      ),

                      SizedBox(height: 12),

                      Text(

                        "Profile",
                        style: TextStyle(

                          fontSize: 18,
                          fontWeight: FontWeight.bold,

                        ),

                      ),

                    ],

                  ),

                ),

              ),

                ],

              ),

            ),

          ],

        ),

        ),

        ),

    );

  }

}