import 'package:flutter/material.dart';
import '/Screens/dashboard/Bottom_navigation_screens/alerts_screen.dart';
import '/Screens/dashboard/Bottom_navigation_screens/clients_screen.dart';
import '/Screens/dashboard/Bottom_navigation_screens/reports_screen.dart';
import '/Screens/dashboard/dashboard_screen.dart';

class MainScreen extends StatefulWidget{

  const MainScreen ({super.key});

  @override

 State<MainScreen> createState() => _MainScreen();

}

class _MainScreen extends State<MainScreen>{

  int currentIndex = 0;

  final List<Widget> screens = [

        const EmployeeDashboardScreen(),
        const ClientsScreen(),
        const ReportsScreen(),
        const AlertsScreen(),

  ];

  @override

  Widget build(BuildContext context){

    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(

          items:[

            BottomNavigationBarItem(

              icon: Icon(Icons.dashboard),
              label: "Dashboard",

            ),

            BottomNavigationBarItem(

              icon: Icon(Icons.people),
              label: "Clients",

            ),

            BottomNavigationBarItem(

              icon: Icon(Icons.bar_chart),
              label:"Report"

            ),

            BottomNavigationBarItem(

              icon: Icon(Icons.notifications),
              label: "Alerts"

            ),

          ],

        currentIndex: currentIndex,

        onTap: (index){

            setState((){

              currentIndex = index;

            });

        },

        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels:true,
        showUnselectedLabels:true,
        selectedFontSize:15,
        unselectedFontSize:12,
        backgroundColor: Colors.white,

        ),

    );

  }

}
