import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget{

  const ReportsScreen ({super.key});

  @override

  State<ReportsScreen> createState() => _ReportsScreenState();

}

class _ReportsScreenState extends State<ReportsScreen>{

  String totalRevenue = "900054";
  int dealsClosed = 19;
  int proposalssent = 42;
  String ConversionRate = "45%";

  @override

  Widget build(BuildContext context){

    Widget _buildBar(double height){

     return Container(

       width: 18,
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
          height: 180,

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

             "TotalRevenue ",
             style: TextStyle(

               color: Colors.white70,
               fontWeight: FontWeight.w500,
               fontSize: 16,

             ),

           ),

           SizedBox(height: 8),

           Text(

               totalRevenue,
             style: TextStyle(

               fontWeight: FontWeight.bold,
               fontSize: 16,
               color: Colors.white,

             ),

           ),

           SizedBox(height: 6),

           Text(

             "This Month",
             style: TextStyle(

               color: Colors.white70,
               fontSize: 14,

             ),

           ),

           const SizedBox(height: 20),

           Row(

             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.end,

             children:[

               _buildBar(50),
               _buildBar(80),
               _buildBar(35),
               _buildBar(100),
               _buildBar(65),

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
                        color: Colors.green,

                      ),

                    ),

                    SizedBox(height:20),

                    Align(

                      alignment: Alignment.centerRight,

                      child: TextButton(

                        onPressed:(){

                        },

                       child: Text(

                        "View Details"

                      ),

                      ),

                    ),

                  ],

                ),

                ],

               ),

               ],

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