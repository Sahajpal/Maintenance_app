import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:maintenance_app/config/palette.dart';
import 'package:maintenance_app/screens/home/machine_list.dart';

import 'appointment.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  int selectedIndex = 0;
  final screen = [Home(), MachineList(), AppointmentCreation(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.MediumGrey,
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        color: Palette.Yellow,
        backgroundColor: Palette.MediumGrey,
        buttonBackgroundColor: Palette.Yellow,
        height: 60,
        items: [
          Icon(Icons.home, size: 30, color: Palette.DarkGrey,),
          Icon(Icons.list, size: 30, color: Palette.DarkGrey,),
          Icon(Icons.app_registration, size: 30, color: Palette.DarkGrey,),
        ],
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        animationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 200),
      ),
      body: screen[selectedIndex],
    );
  }
}
