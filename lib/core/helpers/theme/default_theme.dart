import 'package:flutter/material.dart';

var defaultTheme = ThemeData(
    backgroundColor: const Color.fromRGBO(226, 54, 54, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(226, 54, 54, 1),

    //divider
    dividerColor: Colors.white,
    //appbar
    appBarTheme: const AppBarTheme(centerTitle: true, backgroundColor: Color.fromRGBO(226, 54, 54, 1), elevation: 0),
    //text themes
    textTheme: const TextTheme(
        headline6: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
        subtitle1: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        subtitle2: TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        headline5: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600)),
    //snackbar
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color.fromRGBO(226, 54, 54, 1),
    ),
    //indicator
    indicatorColor: Colors.white,
    //form field

    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintStyle: TextStyle(color: Colors.white, fontSize: 18)));
