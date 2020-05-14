import 'package:flutter/material.dart';
import 'package:online_grocery/screens/settings_screen.dart';
import 'package:online_grocery/widgets/product.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Grocery"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlutterLogo(),
                  Text(
                    "Online Grocery",
                    style: Theme.of(context).textTheme.headline4,
                  )
                ],
              ),
            ),
            Divider(
              indent: 15,
              endIndent: 15,
              thickness: 2,
            ),
            ListTile(
              title: Text(
                "Settings",
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SettingsScreen())),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 6 / 9,
          children: <Widget>[
            Product(
              imageAsset: "assets/images/avocado.jpg",
              title: "Avocado",
            ),
            Product(
              imageAsset: "assets/images/orange.jpg",
              title: "Orange",
            ),
            Product(
              imageAsset: "assets/images/banana.jpg",
              title: "Banana",
            ),
          ],
        ),
      ),
    );
  }
}
