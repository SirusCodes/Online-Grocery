import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:online_grocery/constants.dart';
import 'package:online_grocery/models/product_model.dart';

final cartProvider =
    ChangeNotifierProvider<CartProvider>((_) => CartProvider());

class CartProvider extends ChangeNotifier {
  static List<ProductModel> _cart = [];

  List<ProductModel> get getCart => _cart;

  void incrementItem(String item, Image image) {
    int i = _cart.indexWhere((element) => element.name == item);
    if (i == -1)
      _cart.add(ProductModel(item, 1, image));
    else
      _cart[i].count++;

    notifyListeners();
  }

  void decrementItem(String item) {
    ProductModel _model = _cart.firstWhere((element) => element.name == item);

    _model.count--;
    if (_model.count == 0) _cart.remove(_model);

    notifyListeners();
  }

  int getItemCount(String item) {
    ProductModel _model = _cart.firstWhere(
      (element) => element.name == item,
      orElse: () => ProductModel(null, null, null), // return null object
    );

    return _model.count ?? 0;
  }

  int get getCartTotal {
    return _cart.fold(0, (value, e) => value + (e.count * prices[e.name]));
  }
}
