import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_grocery/provider/cart_provider.dart';
import 'package:online_grocery/widgets/cart_list_products.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Consumer(
        builder: (context, watch, child) {
          List itemList = watch(cartProvider).getCart;
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
      floatingActionButton: Consumer(
        builder: (context, watch, child) {
          final _cart = watch(cartProvider).getCartTotal;
          return FloatingActionButton.extended(
            backgroundColor: Colors.deepOrangeAccent,
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            label: Text(
              "₹$_cart",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
