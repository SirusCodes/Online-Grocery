import 'package:flutter/material.dart';
import 'package:online_grocery/screens/product_details.dart';

class ProductsWithoutButtons extends StatefulWidget {
  const ProductsWithoutButtons({Key key, this.name, this.type})
      : super(key: key);
  final String name, type;

  @override
  _ProductsWithoutButtonsState createState() => _ProductsWithoutButtonsState();
}

class _ProductsWithoutButtonsState extends State<ProductsWithoutButtons> {
  Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
      "assets/images/${widget.type}/${widget.name.toLowerCase()}.jpg",
      gaplessPlayback: true,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image.image, context);
  }

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
              title: widget.name,
            ),
          ),
        ),
        child: Hero(
          tag: widget.name,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image,
          ),
        ),
      ),
    );
  }
}
