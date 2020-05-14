import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_grocery/provider/theme_provider.dart';
import 'package:online_grocery/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Online Grocery',
            theme: theme.getTheme(),
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
