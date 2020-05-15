import 'package:flutter/material.dart';
import 'package:online_grocery/constants.dart';
import 'package:online_grocery/get_it/images_get_it.dart';
import 'package:online_grocery/locator.dart';
import 'package:online_grocery/widgets/cart_icon.dart';
import 'package:online_grocery/widgets/product.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key key, this.type}) : super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    final getIt = locator<ImagesGetIt>();
    List images, names;
    if (type == "Fruits") {
      images = getIt.getFruits;
      names = fruits;
    } else {
      images = getIt.getVegetables;
      names = vegetables;
    }

    buildProductsList() {
      List<Product> prodList = [];
      for (var i = 0; i < 5; i++) {
        prodList.add(Product(image: images[i], title: names[i]));
      }
      return prodList;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(type),
        actions: <Widget>[CartIcon()],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 2,
        childAspectRatio: 6 / 9,
        children: buildProductsList(),
      ),
    );
  }
}
