import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:online_grocery/provider/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: <Widget>[
          Consumer(
            builder: (context, watch, child) {
              final _isDarkMode = watch(themeProvider.state);
              return ListTile(
                title: Text("Enable Dark Mode"),
                trailing: Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    context.read(themeProvider).setTheme(value);
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
