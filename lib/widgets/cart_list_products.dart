import 'package:flutter/material.dart';
import 'package:online_grocery/models/product_model.dart';
import 'package:online_grocery/widgets/add_to_cart_button.dart';

import '../constants.dart';

class CartListProducts extends StatelessWidget {
  const CartListProducts({Key key, @required this.model}) : super(key: key);
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrangeAccent),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            ClipOval(
                child: SizedBox(height: 55, width: 55, child: model.image)),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "${model.count} x ₹${prices[model.name]}",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  width: 150,
                  child: AddToCardButton(
                    title: model.name,
                    image: model.image,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              "₹${prices[model.name] * model.count}",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
