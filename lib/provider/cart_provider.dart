import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  static Map<String, int> _cart = {};

  Map<String, int> get getCart => _cart;

  void incrementItem(String item) {
    if (_cart.containsKey(item))
      _cart[item]++;
    else
      _cart[item] = 1;

    notifyListeners();
  }

  void decrementItem(String item) {
    if (_cart[item] - 1 == 0)
      _cart.remove(item);
    else
      _cart[item]--;

    notifyListeners();
  }

  int getItemCount(String item) {
    return _cart[item] ?? 0;
  }
}
