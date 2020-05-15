import 'package:flutter/material.dart';
import 'package:online_grocery/screens/product_details.dart';

class ProductsWithoutButtons extends StatelessWidget {
  const ProductsWithoutButtons({Key key, this.name, this.image})
      : super(key: key);
  final String name;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetails(
              image: image,
              title: name,
            ),
          ),
        ),
        child: Hero(
          tag: name,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image,
          ),
        ),
      ),
    );
  }
}
