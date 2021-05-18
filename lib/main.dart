import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:maintenance_app/config/palette.dart';
import 'package:maintenance_app/screens/auth/auth.dart';
import 'package:maintenance_app/screens/home_page.dart';
import 'package:maintenance_app/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      child: MaterialApp(
        title: 'Maintenance App',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.muliTextTheme(),
          accentColor: Palette.DarkGrey,
          appBarTheme: const AppBarTheme(
            brightness: Brightness.dark,
            color: Palette.Yellow,
          ),
        ),
        home: Splash(),
      ),
    );
  }
}
