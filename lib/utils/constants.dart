import 'package:flutter/material.dart';
import 'package:max_food/viewmodel/model/menu.dart';

class Constants{
   static BoxDecoration shadow = BoxDecoration(
     color: Colors.white,
     boxShadow: [
       BoxShadow(
         color: Colors.grey.withOpacity(0.5),
         spreadRadius: 0,
         blurRadius: 1,
         offset: Offset(0, 0.1), // changes position of shadow
       ),
     ],
   );

   static Category favouriteCategory;
}

class Routes{
  static const String LOGIN = "/login";
  static const String REGISTER = "/register";
  static const String LANDING = "/navigation_screen";
  static const String MENU = "/menu";
  static const String OPTION = "/option";
  static const String CART = "/cart";
  static const String CHECKOUT = "/checkout";

}