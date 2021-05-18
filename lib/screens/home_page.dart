import 'package:flutter/material.dart';
import 'package:maintenance_app/screens/auth/auth.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maintenance'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            context.signOut();
            //Navigator.of(context).push(AuthScreen.route);
          },
          child: const Text('Sign out'),
        ),
      ),
    );
  }
}
