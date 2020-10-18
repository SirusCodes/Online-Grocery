import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:online_grocery/locator.dart';
import 'package:online_grocery/provider/theme_provider.dart';
import 'package:online_grocery/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup(); // initializing get it

  // take the previously set theme and pass it to the   provider
  runApp(ProviderScope(child: MyApp()));

  // to make status bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final theme = watch(themeProvider.state);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Grocery',
      theme: theme ? darkTheme : lightTheme,
      home: MainScreen(),
    );
  }
}
