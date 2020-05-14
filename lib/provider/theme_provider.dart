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
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  accentColor: Colors.white,
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.white60,
  appBarTheme: AppBarTheme(elevation: 0.0, color: const Color(0xFF1E1E1E)),
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.white54,
  appBarTheme: AppBarTheme(elevation: 0.0, color: Colors.white),
);
