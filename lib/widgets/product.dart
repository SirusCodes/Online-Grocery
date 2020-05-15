import 'package:flutter/material.dart';
import 'package:online_grocery/screens/product_details.dart';
import 'package:online_grocery/widgets/add_to_cart_button.dart';

import '../constants.dart';

class Product extends StatefulWidget {
  const Product({Key key, @required this.imageAsset, @required this.title})
      : super(key: key);
  final String imageAsset, title;
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(widget.imageAsset);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ProductDetails(
            image: image,
            title: widget.title,
          ),
        ),
      ),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: widget.title,
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
                    buildTitle(context, widget.title),
                    AddToCardButton(
                      title: widget.title,
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
