import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = StateNotifierProvider((_) => ThemeProvider());

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(false);

  getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getBool("darkMode");
  }

  setTheme(bool theme) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkMode", theme);
    state = theme;
  }
}

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  buttonColor: Colors.deepOrangeAccent,
  accentColor: Colors.white,
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.white60,
  iconTheme: IconThemeData(color: Colors.white38),
  textTheme: TextTheme(
    headline6: TextStyle(color: Colors.white60),
    headline4: TextStyle(color: Colors.white),
  ),
  appBarTheme: AppBarTheme(elevation: 0.0, color: const Color(0xFF1E1E1E)),
);

final lightTheme = ThemeData(
  primaryColor: Colors.grey[200],
  brightness: Brightness.light,
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.black26,
  iconTheme: IconThemeData(color: Colors.black45),
  textTheme: TextTheme(
    headline6: TextStyle(color: Colors.black38),
    headline4: TextStyle(color: Colors.black),
  ),
  appBarTheme: AppBarTheme(elevation: 0.0, color: Colors.white),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.deepOrangeAccent,
    splashColor: Colors.white60,
  ),
);
