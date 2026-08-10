import 'package:flutter/material.dart';
import '/models/notification_model.dart';

class AlertsScreen extends StatefulWidget{

  const AlertsScreen({super.key});

  @override

  State<AlertsScreen> createState() => _AlertsScreenState();

}

class _AlertsScreenState extends State<AlertsScreen>{

  List<NotificationModel> notifications = [

    NotificationModel(

      title:"Proposal viewed by nikhil Traders",
      description:"PR-204 was opened by the client.",
      time:"1 hours ago",
      icon: "Proposal",

    ),

    NotificationModel(

      title: "Counter Offer received",
      description: "Nikhil Traders sent a counter offer",
      time:"3 hours ago",
      icon:"offer",

    ),


    NotificationModel(

      title: "Agreement Signed",
      description: "The Agreement Signed by the client",
      time: "yesterday",
      icon:"agreement",

    ),

    NotificationModel(

      title: "Deal Closed succesfully",
      description: "Deal with Nikhil Traders has been closed.",
      time: "Yesterday",
      icon: "deal",

    ),

  ];

  Widget _notificationItem(NotificationModel notification){

    return Column(

      children:[

       Row(

         crossAxisAlignment: CrossAxisAlignment.start,

         children: [

           Container(

             width: 44,
             height:44,

             decoration: BoxDecoration(

               color: Colors.blue.shade50,
               borderRadius: BorderRadius.circular(12),

             ),

             child:  Icon(

               _getNotificationIcon(notification.icon),
               color: Colors.blue,

             ),

           ),

           const SizedBox(width: 12),

           Expanded(

             child: Column(

               crossAxisAlignment: CrossAxisAlignment.start,

               children:[

                 Text(

                   notification.title,
                   style: TextStyle(

                     fontSize: 15,
                     fontWeight: FontWeight.bold,

                   ),

                 ),

                 const SizedBox(height: 4),

               Text(

                 notification.description,
                 style: TextStyle(

                   fontSize: 14,
                   color: Colors.grey,

                 ),

               ),

                 const SizedBox(height: 6),

               Text(

                 notification.time,
                 style: TextStyle(

                   fontSize: 12,
                   color: Colors.grey,

                 ),
               ),

               ],

             ),

           ),

         ],

       ),

        const Divider(),

      ],

    );

  }

  IconData _getNotificationIcon(String icon){

    switch(icon){

      case "Proposal":
       return Icons.description;

      case "offer":
      return Icons.chat_bubble_outline;

      case "agreement":
      return Icons.edit;

      case "deal":
      return Icons.celebration;

      default :
        return Icons.notifications;

    }

  }

  @override

  Widget build(BuildContext context){

   return Scaffold(

     body: SafeArea(

       child: SingleChildScrollView(

         child: Padding(

           padding: EdgeInsets.all(20),

         child: Column(

           crossAxisAlignment: CrossAxisAlignment.start,

           children:[

             const Text(

               "Notifications",
               style: TextStyle(

                 fontSize: 24,
                 fontWeight:FontWeight.bold,

               ),

             ),

             const SizedBox(height: 20),

             // nofication yha dynamically aayegi

             ...notifications.map(

                 (notification) => _notificationItem(notification),

             ),

           ],

         ),

         ),

       ),

     ),

   );

  }

}