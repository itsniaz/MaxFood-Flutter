import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_food/screens/checkout.dart';
import 'package:max_food/screens/landing.dart';
import 'package:max_food/screens/login.dart';
import 'package:max_food/screens/menu.dart';
import 'package:max_food/screens/cart.dart';
import 'package:max_food/screens/nav_drawer.dart';
import 'package:max_food/screens/option.dart';
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
        title: 'Max Food',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
         textTheme: GoogleFonts.latoTextTheme(
           Theme.of(context).textTheme,
         ),
        ),
        routes: {
          '/': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/login': (context) => LoginScreen(),
          '/navigation_screen': (context) => MainNavDrawer(),
          '/menu': (context) => MenuScreen(),
          '/option': (context) => OptionScreen(),
          '/cart': (context) => CartScreen(),
          '/checkout': (context) => CheckoutScreen(),
        },
    );
  }
}
