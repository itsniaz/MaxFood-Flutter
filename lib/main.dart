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
import 'package:max_food/utils/constants.dart';
import 'package:max_food/utils/shared_perference_manager.dart';
import 'package:max_food/viewmodel/menu_viewmodel.dart';
import 'package:max_food/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  SharedPrefManager.getInstance().getFavouriteDishes().then((category){
    if (category!=null) {
      Constants.favouriteCategory = category;
    }
    else
      {

      }
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => UserViewModel(),lazy: false,),
        ListenableProvider(create: (_) => MenuViewModel(),lazy: true,),
      ],
      child: MaterialApp(
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
            '/register': (context) => SignUpScreen(),
            '/login': (context) => LoginScreen(),
            '/navigation_screen': (context) => MainNavDrawer(),
            '/menu': (context) => MenuScreen(),
            '/option': (context) => OptionScreen(),
            '/cart': (context) => CartScreen(),
            '/checkout': (context) => CheckoutScreen(),
          },
      ),
    );
  }
}
