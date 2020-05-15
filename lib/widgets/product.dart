import 'package:flutter/material.dart';
import 'package:online_grocery/screens/product_details.dart';
import 'package:online_grocery/widgets/add_to_cart_button.dart';

import '../constants.dart';

class Product extends StatelessWidget {
  const Product({Key key, @required this.image, @required this.title})
      : super(key: key);
  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetails(
            image: image,
            title: title,
          ),
        ),
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: title,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: image,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildTitle(context, title),
                    AddToCardButton(
                      title: title,
                      image: image,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).primaryTextTheme.headline6,
        ),
        Text(
          "₹${prices[title]}",
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
