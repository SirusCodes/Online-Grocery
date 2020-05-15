import 'package:flutter/material.dart';
import 'package:online_grocery/constants.dart';
import 'package:online_grocery/get_it/images_get_it.dart';
import 'package:online_grocery/get_it/location_handler.dart';
import 'package:online_grocery/locator.dart';
import 'package:online_grocery/screens/item_list.dart';
import 'package:online_grocery/screens/settings_screen.dart';
import 'package:online_grocery/widgets/cart_icon.dart';
import 'package:online_grocery/widgets/product_without_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final imageGetIt = locator<ImagesGetIt>();
  final locationGetIt = locator<LocationHandler>();

  @override
  void initState() {
    super.initState();
    imageGetIt.initAll();
    if (!locationGetIt.getPermStatus) locationGetIt.requestLocationPerm();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    imageGetIt.cacheImages(context);

    // it will update the app location after 2 sec
    // might use stream after later!!
    Future.delayed(Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var icon = Icon(
      Icons.keyboard_arrow_right,
      color: Theme.of(context).iconTheme.color,
      size: 35,
    );

    var textOverImage = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "One place for all grocery needs!!",
        style: Theme.of(context).textTheme.headline3.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [Shadow(color: Colors.black87, offset: Offset(1, 1))],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Online Grocery"),
        actions: <Widget>[CartIcon()],
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      "assets/images/start_img.jpg",
                      gaplessPlayback: true,
                    ),
                  ),
                  textOverImage
                ],
              ),
            ),
            locationButton(),
            seeAllButton(context, icon, "Fruits"),
            horizontalScroll(imageGetIt.getFruits, fruits),
            seeAllButton(context, icon, "Vegetables"),
            horizontalScroll(imageGetIt.getVegetables, vegetables)
          ],
        ),
      ),
    );
  }

  SizedBox horizontalScroll(List<Image> imgList, List<String> list) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductsWithoutButtons(
            image: imgList[index],
            name: list[index],
          );
        },
      ),
    );
  }

  FlatButton seeAllButton(BuildContext context, Icon icon, String title) {
    return FlatButton(
      padding: const EdgeInsets.all(8.0),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ItemList(type: title)));
      },
      splashColor: Colors.deepOrange[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          icon,
        ],
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
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
    );
  }

  Widget locationButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 50,
      child: RaisedButton(
        child: FittedBox(
          child: FutureBuilder(
            future: locationGetIt.getLastLocationAdd(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              return Text(
                "Current Location: ${snapshot.data}",
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline6
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
        onPressed: _reqPerm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  _reqPerm() {
    if (!locationGetIt.getPermStatus) locationGetIt.requestLocationPerm();
  }
}
