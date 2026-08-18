import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeDashboardScreen extends StatefulWidget{

  final Map<String , dynamic > user;

  const EmployeeDashboardScreen({super.key, required this.user});

  @override

  State<EmployeeDashboardScreen> createState() => _EmployeeDeshboardScreenState();
}

class _EmployeeDeshboardScreenState extends State<EmployeeDashboardScreen>{

  List<dynamic> activities = [];

  Future<void> fetchActivities() async{

    final url = Uri.parse(

      "http://192.168.2.220:3000/api/activities/{user_id}",

    );

    final response = await http.get(url);

    if(response.statusCode == 200){

      final data = jsonDecode(response.body);

      if(!mounted) return;

      setState((){

        activities = data["activities"];

      });

    }

  }

  @override

  void initState(){

    super.initState();

    fetchActivities();

  }

  @override

  Widget build(BuildContext context){

    return Scaffold(

      body: SafeArea(

        child: SingleChildScrollView(

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

             Text(

              "${widget.user['name']}",
              style: TextStyle(

                fontSize: 28,
                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height:20),

            Column(

              children:[

                Row(

                  children:[

                    Expanded(

                      child: Container(

                      //  height: 170,

                        decoration: BoxDecoration(

                          color: Colors.white,

                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(

                            color: Colors.grey.shade200,

                          ),

                        ),

                        child: Padding(

                          padding: const EdgeInsets.all(16),

                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children:[

                              Container(

                                width:50,
                                height: 50,

                                decoration: BoxDecoration(

                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(15),

                                ),

                                child: const Icon(

                                  Icons.person_add_alt_1,
                                  color: Colors.blue,
                                  size: 28,

                                ),

                              ),

                              const SizedBox(height:20),

                              const Text(

                                "12",
                                style: TextStyle(

                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,

                                ),

                              ),

                              const SizedBox(height: 6),

                              const Text(

                                "New Clients",
                                style: TextStyle(

                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,

                                ),

                              ),

                            ],

                          ),

                        ),

                      ),

                    ),

                    const SizedBox(width: 16),

                    Expanded(

                      child: Container(

                      //  height: 170,

                        decoration: BoxDecoration(

                          color: Colors.white,

                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(

                            color: Colors.grey.shade200,

                          ),

                        ),

                        child: Padding(

                          padding: EdgeInsets.all(16),

                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children:[

                              Container(

                                width: 50,
                                height: 50,

                                decoration: BoxDecoration(

                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(15),

                                ),

                                child: const Icon(

                                  Icons.people,
                                  size: 28,
                                  color: Colors.green,

                                ),

                              ),

                              const SizedBox(height: 20),

                              Text(

                                "24",
                                style: TextStyle(

                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,

                                ),

                              ),

                              const SizedBox(height: 6),

                              Text(

                                "Returning Clients",
                                style: TextStyle(

                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,

                                ),

                              ),

                            ],

                          ),

                        ),

                      ),

                    ),

                  ],

                ),

                const SizedBox(height: 16),

                Row(

                  children: [

                    Expanded(

                      child: Container(

                       // height: 170,

                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(

                            color: Colors.grey.shade200,

                          ),

                        ),

                        child: Padding(

                          padding: EdgeInsets.all(16),

                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children:[

                              Container(

                                width: 50,
                                height: 50,

                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orange.shade50,

                                ),

                                child: const Center(
                                child: const Icon(

                                  Icons.calendar_today,
                                  color: Colors.orange,
                                  size: 28,

                                ),
                                ),

                              ),

                              const SizedBox(height: 20),

                              Text(

                                "8",
                                style: TextStyle(

                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,

                                ),

                              ),

                              const SizedBox(height: 6),

                              Text(

                                "Visits Today",
                                style: TextStyle(

                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,

                                ),

                              ),

                            ],

                          ),

                        ),


                      ),

                    ),

                    const SizedBox(width : 16),

                    Expanded(

                     child: Container(

                      // height: 170,

                       decoration: BoxDecoration(

                         color: Colors.white,
                         borderRadius: BorderRadius.circular(20),

                         border: Border.all(

                           color: Colors.grey.shade200,

                         ),

                       ),

                      child: Padding(

                        padding: const EdgeInsets.all(16),

                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,

                          children:[

                            Container(

                              height: 50,
                              width: 50,

                              decoration: BoxDecoration(

                                color: Colors.amber.shade50,
                                borderRadius: BorderRadius.circular(15),

                              ),

                              child: const Icon(

                                Icons.description,
                                size: 28,
                                color: Colors.amber,

                              ),

                            ),
                            const SizedBox(height: 20),

                            Text(

                              "15",
                              style: TextStyle(

                                fontSize: 28,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,

                              ),

                            ),

                            const SizedBox(height: 6),

                           const Text(

                              "Pending Proposals",
                              style: TextStyle(

                                fontSize: 16,
                                color:Colors.grey,
                                fontWeight: FontWeight.w500,

                              ),

                            ),

                          ],

                        ),

                      ),

                     ),

                    ),

                  ],

                ),

                const SizedBox(height: 16),

                Row(

                  children:[

                    Expanded(

                      child: Container(

                        //height: 170,

                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(

                            color: Colors.grey.shade200,

                          ),

                        ),

                        child: Padding(

                          padding: EdgeInsets.all(16),


                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children:[

                              Container(

                                width:50,
                                height: 50,

                                decoration: BoxDecoration(

                                  color: Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(15),

                                ),

                                child: Icon(

                                  Icons.handshake,
                                  size: 28,
                                  color: Colors.purple,

                                ),

                              ),

                              const SizedBox(height: 20),

                              Text(

                                "7",
                                style: TextStyle(

                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.black,

                                ),

                              ),

                              const SizedBox(height: 6),

                              Text(

                                "Negotiations",
                                style: TextStyle(

                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,

                                ),

                              ),

                            ],

                          ),

                        ),

                      ),

                    ),

                    const SizedBox(width: 16),

                    Expanded(

                      child: Container(

                       // height: 172,

                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(

                            color: Colors.grey.shade200,

                          ),

                        ),

                        child:Padding(

                          padding: EdgeInsets.all(16),

                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children:[

                              Container(

                                width:50,
                                height: 50,

                                decoration: BoxDecoration(

                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(15),

                                ),

                                child: const Icon(

                                  Icons.check_circle,
                                  size: 28,
                                  color: Colors.red,

                                ),

                              ),

                              const SizedBox(height: 20),

                              Text(

                                "22",
                                style: TextStyle(

                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,

                                ),

                              ),

                              const SizedBox(height: 6),

                             const Text(

                               "Closed Deals",
                               style: TextStyle(

                                 fontSize: 16,
                                 fontWeight: FontWeight.w500,
                                 color: Colors.grey,

                               ),

                             ),

                            ],

                          ),

                        ),

                      ),

                    ),

                  ],

                ),

              ],

            ),

            const SizedBox(height: 25),

            Row(

              children:[

                Text(

                  "Recent Activity",
                  style: TextStyle(

                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                  ),

                ),

                const Spacer(),

                TextButton(

                  onPressed:(){


                  },

                  child: const Text(

                  "View All"

                  ),

                ),

              ],

            ),

            const SizedBox(height: 15),

            Container(

              decoration: BoxDecoration(

                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                border: Border.all(

                  color: Colors.grey.shade200,

                ),

              ),

              child: Column(

                children:[

                  ListTile(

                    leading: CircleAvatar(

                      backgroundColor: Colors.blue.shade50,

                      child: const Icon(

                        Icons.person_add,
                        color: Colors.blue,

                      ),

                    ),

                    title: const Text(

                      "New Client Added",

                    ),

                    subtitle: const Text(

                      "2 Minutes ago",

                    ),

                    trailing: const Icon(

                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.grey,

                    ),

                  ),

                  const Divider(height: 1),

                  ListTile(

                    leading: CircleAvatar(

                      backgroundColor: Colors.green.shade50,

                      child: const Icon(

                        Icons.description,
                        color: Colors.green,

                      ),

                    ),

                    title: const Text(

                      "Proposal sent",

                    ),

                    subtitle: const Text(

                      "15 Minutes ago",

                    ),

                    trailing: const Icon(

                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.grey,

                    ),

                  ),

                  const Divider(height: 1),

                  ListTile(

                    leading: CircleAvatar(

                      backgroundColor: Colors.orange.shade50,

                      child: const Icon(

                        Icons.handshake,
                        color: Colors.orange,

                      ),

                    ),

                    title: Text(

                      "Finalized",

                    ),

                    subtitle: Text(

                      "1 hour ago",

                    ),

                    trailing: const Icon(

                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Colors.grey,

                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(height: 10),

                ],

              ),

            ),

        ),

      ),

    );

  }

}