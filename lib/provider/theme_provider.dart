import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData themeData;

  ThemeProvider({this.themeData});

  getTheme() => themeData;

  setTheme(ThemeData themeData) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool("darkMode", themeData == darkTheme);
    this.themeData = themeData;
    notifyListeners();
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
