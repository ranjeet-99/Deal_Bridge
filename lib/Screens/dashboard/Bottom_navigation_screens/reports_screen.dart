import 'package:flutter/material.dart';
import '/models/report_model.dart';

class ReportsScreen extends StatefulWidget{

  const ReportsScreen ({super.key});

  @override

  State<ReportsScreen> createState() => _ReportsScreenState();

}

class _ReportsScreenState extends State<ReportsScreen>{

  String totalRevenue = "985054";
  int dealsClosed = 19;
  int proposalssent = 42;
  String ConversionRate = "45%";

  List<ReportClient> topclient = [

    ReportClient(
    Name: "Verma Electronics",
    revenue: 185000,
    ),

  ];

  List<FollowUp> followups = [

    FollowUp(

      ClientName: "Nikhil Traders",
      DueDate: "Tomorrow",

    ),

    FollowUp(

      ClientName: "Raj Agro foods",
      DueDate: "3rd August",

    ),

  ];

  @override

  Widget build(BuildContext context){

    Widget _buildBar(double height){

     return Container(

       width: 110,
       height: height,

       decoration: BoxDecoration(

         color: Colors.white54,
         borderRadius: BorderRadius.circular(10),

       ),

     );

    }

   return Scaffold(

    body: SafeArea(

      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children:[

          Text(

            "Reports",
            style: TextStyle(

              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height: 20),

        Container(

          width: double.infinity,
          height: 300,

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(20),

          gradient: LinearGradient(

            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors:[

              Colors.blue,
              Colors.deepPurple,

            ],

          ),

        ),

         child: Padding(

          padding: const EdgeInsets.all(20),

        child: Column(

         crossAxisAlignment: CrossAxisAlignment.start,

         children:[

           Text(

             "TotalRevenue - This Month ",
             style: TextStyle(

               color: Colors.white70,
               fontWeight: FontWeight.w500,
               fontSize: 19,

             ),

           ),

           SizedBox(height: 8),

           Text(

               totalRevenue,
             style: TextStyle(

               fontWeight: FontWeight.bold,
               fontSize: 35,
               color: Colors.white,

             ),

           ),

           const SizedBox(height: 20),

           Row(

             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.end,

             children:[

               _buildBar(50),
               _buildBar(80),
               _buildBar(80),
               _buildBar(50),

               Container(

                 width: 110,
                 height: 130,

                 decoration: BoxDecoration(

                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10),

                 ),

               ),

             ],

           ),

         ],

        ) ,


          ),


        ),

        SizedBox(height: 20),

       Container(

         width: double.infinity,
         padding: const EdgeInsets.all(18),

         decoration: BoxDecoration(

           color: Colors.white,
           borderRadius: BorderRadius.circular(16),

         ),

         child: Column(

           crossAxisAlignment: CrossAxisAlignment.start,

           children:[

          Text(

            "Sales Overview",
            style: TextStyle(

              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),

          ),

         SizedBox(height: 18),

             Row(

               mainAxisAlignment: MainAxisAlignment.spaceBetween,

               children:[

                 Text(

                   "Deals Closed",
                   style: TextStyle(

                     color:Colors.grey,
                     fontSize: 16,

                   ),

                 ),

                 Text(

                   dealsClosed.toString(),
                   style: TextStyle(

                     fontSize: 18,
                     fontWeight: FontWeight.bold,

                   ),

                 ),

               ],
             ),

               const SizedBox(height: 16),

                 Divider(),

               const SizedBox(height: 16),

               Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children:[

                  Text(

                    "Proposals Sent",
                    style: TextStyle(

                      fontSize: 16,
                      color: Colors.grey,

                    ),

                  ),

                  Text(

                    proposalssent.toString(),
                    style: TextStyle(

                      fontSize: 18,
                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  ],
               ),

                  SizedBox(height: 16),

                  Divider(),

                  SizedBox(height: 16),

                Row(

                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children:[

                    Text(

                      "Conversion Rate",
                      style: TextStyle(

                        fontSize: 16,
                        color: Colors.grey,

                      ),

                    ),

                    Text(

                      ConversionRate,
                      style: TextStyle(

                        fontSize: 18,
                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ],

                ),

             SizedBox(height:20),

           ],

         ),

       ),

          Container(

            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(16),

            ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children:[

                Text(
                  "Top Clients ",
                  style: TextStyle(

                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 16),

               ...topclient.map(

                 (client) => Column(

                   children:[

                      Padding(

                 padding: const EdgeInsets.symmetric(vertical: 16),

             child:   Row(

                 mainAxisAlignment: MainAxisAlignment.spaceBetween,

                 children:[

                   Text(

                     topclient[0].Name,
                     style: TextStyle(

                       fontSize: 16,
                       color: Colors.grey,

                     ),


                   ),

                   Text(

                     "${topclient[0].revenue.toStringAsFixed(0)}",
                     style: TextStyle(

                       fontSize: 16,
                       fontWeight: FontWeight.bold,

                     ),

                   ),

                 ],

               ),
                 ),

               const Divider(),

     ],

               ),

               ),

              ],

            ),


          ),

          const SizedBox(height:20),

          Container(

            width: double.infinity,
            padding: const EdgeInsets.all(18),

            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.circular(16),

            ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children:[

                Text(

                  "Follow-Ups Due",
                  style: TextStyle(

                    fontSize: 20,
                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 16),

              ...followups.map(

                  (FollowUp) => Column(

                   children:[

                     Padding(

                    padding: const EdgeInsets.symmetric(vertical: 12),

                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children:[

                      Text(

                        FollowUp.ClientName,
                        style: TextStyle(

                          fontSize: 16,
                          color: Colors.grey,

                        ),

                      ),

                    Text(

                      FollowUp.DueDate,
                      style: TextStyle(

                        fontSize: 16,
                        fontWeight: FontWeight.bold,

                      ),


                    ),

                    ],

                  ),

                  ),

                 const Divider(),

               ],

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