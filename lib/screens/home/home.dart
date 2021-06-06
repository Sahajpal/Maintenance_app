import 'package:flutter/material.dart';
import 'package:maintenance_app/config/palette.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.MediumGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HOME',
          style: TextStyle(color: Palette.DarkGrey),
        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
