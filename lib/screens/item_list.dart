import 'package:flutter/material.dart';
import 'package:online_grocery/constants.dart';
import 'package:online_grocery/widgets/cart_icon.dart';
import 'package:online_grocery/widgets/product.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key key, this.type}) : super(key: key);
  final String type;
  @override
  Widget build(BuildContext context) {
    final list = type == "Fruits" ? fruits : vegetables;
    return Scaffold(
      appBar: AppBar(
        title: Text(type),
        actions: <Widget>[CartIcon()],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 2,
        childAspectRatio: 6 / 9,
        children: list
            .map(
              (e) => Product(
                imageAsset:
                    "assets/images/${type.toLowerCase()}/${e.toLowerCase()}.jpg",
                title: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
