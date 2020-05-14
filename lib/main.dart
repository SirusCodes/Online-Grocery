import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_grocery/provider/theme_provider.dart';
import 'package:online_grocery/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // take the previously set theme and pass it to the provider
  SharedPreferences.getInstance().then((value) {
    var darkMode = value.getBool("darkMode") ?? false;
    runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (context) =>
          ThemeProvider(themeData: darkMode ? darkTheme : lightTheme),
      child: MyApp(),
    ));
  });

  // to make status bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Online Grocery',
          theme: theme.getTheme(),
          home: MainScreen(),
        );
      },
    );
  }
}
