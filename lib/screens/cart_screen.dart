import 'package:flutter/material.dart';
import 'package:online_grocery/provider/cart_provider.dart';
import 'package:online_grocery/widgets/cart_list_products.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Consumer<CartProvider>(
        builder: (context, _cart, child) {
          List itemList = _cart.getCart;
          return ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CartListProducts(model: itemList[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: Consumer<CartProvider>(
        builder: (context, cart, child) {
          return FloatingActionButton.extended(
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            label: Text(
              "₹${cart.getCartTotal}",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
