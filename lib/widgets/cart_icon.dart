import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_grocery/provider/cart_provider.dart';
import 'package:online_grocery/screens/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final cart = watch(cartProvider);
        return Badge(
          position: BadgePosition.topRight(top: 5, right: 5),
          animationType: BadgeAnimationType.fade,
          badgeColor: Colors.deepOrangeAccent,
          badgeContent: Text(
            cart.getCart.length.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: child,
        );
      },
      child: IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CartScreen()));
        },
      ),
    );
  }
}
