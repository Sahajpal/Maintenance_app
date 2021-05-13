import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'auth.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen())));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/jrew_logo.png',
            height: 300,
          ),
          SpinKitCircle(
            color: Colors.amber,
            size: 100,
          ),
        ],
      ),
    );
  }
}
