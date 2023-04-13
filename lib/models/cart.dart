import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    ['apple', '70', 'lib/assets/apple.png', Colors.green],
    ['banana', '140', 'lib/assets/banana.jpg', Colors.yellow],
    ['pear', '120', 'lib/assets/pear.jpg', Colors.lime],
    ['persimmon', '90', 'lib/assets/persimmon.png', Colors.deepOrange]
  ];

  // list of cart items
  final List _cartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
