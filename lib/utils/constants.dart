import 'package:flutter/material.dart';

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
}