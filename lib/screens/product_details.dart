import 'package:flutter/material.dart';
import 'package:online_grocery/widgets/add_to_cart_button.dart';
import 'package:online_grocery/widgets/cart_icon.dart';

import '../constants.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key key, this.title, this.image}) : super(key: key);
  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: <Widget>[CartIcon()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(18.0),
        children: <Widget>[
          Hero(
            tag: title,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  "₹${prices[title]}",
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          Divider(),
          AddToCardButton(
            title: title,
            image: image,
          ),
          SizedBox(height: 15),
          Text(
            "Details:",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 10),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          ),
        ],
      ),
    );
  }
}
