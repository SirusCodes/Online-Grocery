import 'package:flutter/material.dart';
import 'package:online_grocery/widgets/add_to_cart_button.dart';

class Product extends StatelessWidget {
  const Product({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset("assets/images/avacado.jpg")),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildTitle(context, "Avacado"),
                    AddToCardButton(),
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
          "₹₹₹",
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
