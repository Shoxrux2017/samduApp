// ignore_for_file: file_names

import 'package:flutter/material.dart';

//LightTheme
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  textTheme: lightTextTheme,
  
);

TextStyle lightTextStyle = const TextStyle(
  fontSize: 20,
  color: Colors.black,
);
TextTheme lightTextTheme = TextTheme(
  bodyLarge: lightTextStyle,
);

//DarkTheme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
);

TextStyle darkTextStyle = const TextStyle(
  fontSize: 20,
  color: Colors.white,
);
TextTheme darkTextTheme = TextTheme(
  bodyLarge: lightTextStyle,
);