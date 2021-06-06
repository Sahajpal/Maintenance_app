import 'package:flutter/material.dart';
import 'package:maintenance_app/config/palette.dart';
import 'package:maintenance_app/screens/additional/add_machines.dart';

class MachineList extends StatefulWidget {
  const MachineList({Key key}) : super(key: key);

  @override
  _MachineListState createState() => _MachineListState();
}

class _MachineListState extends State<MachineList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.MediumGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MACHINE LIST',
          style: TextStyle(color: Palette.DarkGrey),
        ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return AddMachines();
        }));
      },),
    );
  }
}
