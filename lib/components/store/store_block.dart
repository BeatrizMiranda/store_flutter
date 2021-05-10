import 'package:flutter/material.dart';
import 'package:store/mockup/store_products.dart';

enum StoreState { normal, details, cart }

class StoreBlock with ChangeNotifier {
  StoreState storeState = StoreState.normal;
  List<StoreProduct> catalog = List.unmodifiable(storeProducts);
  List<StoreItem> cart = [];

  void changeToNormal() {
    storeState = StoreState.normal;
    notifyListeners();
  }

  void changeToCart() {
    storeState = StoreState.cart;
    notifyListeners();
  }

  void addProduct(StoreProduct product) {
    for (StoreItem item in cart) {
      if (item.product.name == product.name) {
        item.increment();
        notifyListeners();
        return;
      }
    }

    cart.add(StoreItem(product: product));
    notifyListeners();
  }
}

class StoreItem {
  int quantity;
  final StoreProduct product;

  StoreItem({this.quantity = 1, @required this.product});

  void add() {}

  void increment() {
    quantity++;
  }

  void decrement() {}
}
