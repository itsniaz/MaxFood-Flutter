import 'package:flutter/material.dart';
import 'package:max_food/screens/landing.dart';
import 'package:max_food/screens/login.dart';
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
        ),
        routes: {
          '/': (context) => LandingScreen(),
          '/signup': (context) => SignUpScreen(),
          '/login': (context) => LoginScreen(),
        },
    );
  }
}
