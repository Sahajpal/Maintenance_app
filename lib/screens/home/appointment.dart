import 'package:flutter/material.dart';
import 'package:maintenance_app/config/palette.dart';

class AppointmentCreation extends StatefulWidget {
  const AppointmentCreation({Key key}) : super(key: key);

  @override
  _AppointmentCreationState createState() => _AppointmentCreationState();
}

class _AppointmentCreationState extends State<AppointmentCreation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.MediumGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'APPOINTMENT',
          style: TextStyle(color: Palette.DarkGrey),
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
