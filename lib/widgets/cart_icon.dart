import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:online_grocery/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) => Badge(
        position: BadgePosition.topRight(top: 5, right: 5),
        animationType: BadgeAnimationType.fade,
        badgeContent: Text(cart.getCart.length.toString()),
        child: child,
      ),
      child: IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {},
      ),
    );
  }
}
