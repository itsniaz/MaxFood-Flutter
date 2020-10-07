import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_food/screens/landing.dart';
import 'package:max_food/screens/login.dart';
import 'package:max_food/screens/nav_drawer.dart';
import 'package:max_food/screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
//          textTheme: GoogleFonts.montserratTextTheme(
//            Theme.of(context).textTheme,
//          ),
        ),
        routes: {
          '/': (context) => MainNavDrawer(),
          '/signup': (context) => SignUpScreen(),
          '/login': (context) => LoginScreen(),
          '/navigation_screen': (context) => MainNavDrawer(),
        },
    );
  }
}
