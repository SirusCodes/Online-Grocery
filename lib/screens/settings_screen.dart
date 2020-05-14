import 'package:flutter/material.dart';
import 'package:online_grocery/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: <Widget>[
          Consumer<ThemeProvider>(
            builder: (context, theme, child) {
              return ListTile(
                title: Text("Enable Dark Mode"),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                      theme.setTheme(_isDarkMode ? darkTheme : lightTheme);
                    });
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
