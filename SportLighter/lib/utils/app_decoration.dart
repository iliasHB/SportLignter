import 'package:flutter/material.dart';

class AppDecoration {

  static ButtonStyle get buttonStyling =>
      ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.blueGrey),
      );

  ///-------------------------------------------------------------

  static BoxDecoration get interestDecoration =>
      BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)
      );
}