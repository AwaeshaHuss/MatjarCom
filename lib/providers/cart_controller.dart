import 'package:flutter/material.dart';
import 'package:matjarcom/models/product.dart';

class CartController with ChangeNotifier {
  List<Product> _items = [];
  double _price = double.parse('0.0');
  int _quantity = 0;

  List<Product> get items => _items;
  double get price => _price;
  int get quantity => _quantity;

  void add(Product product) {
    _items.add(product);
    _price += double.parse(product.price ?? '0.0');
    _quantity += product.quantity ?? 0;
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product);
    _price -= double.parse(product.price ?? '0.0');
    _quantity -= product.quantity ?? 0;
    notifyListeners();
  }

  void emptyBasket() {
    _items = [];
    _price = 0.0;
    _quantity = 0;
    notifyListeners();
  }
}
