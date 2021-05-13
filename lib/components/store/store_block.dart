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

  void decrementQtd(StoreProduct product) {
    for (StoreItem item in cart) {
      if (item.product.name == product.name) {
        item.decrement();

        if (item.quantity == 0) {
          cart.remove(product);
        }

        notifyListeners();
        return;
      }
    }
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

  void deleteProduct(StoreItem product) {
    cart.remove(product);
    notifyListeners();
  }

  String totalPriceInCart() => cart
      .fold<double>(
          0.0,
          (previous, element) =>
              previous + (element.quantity * element.product.price))
      .toStringAsFixed(2);

  int totalItemsCart() =>
      cart.fold<int>(0, (previous, element) => previous + element.quantity);
}

class StoreItem {
  int quantity;
  final StoreProduct product;

  StoreItem({this.quantity = 1, @required this.product});

  void increment() {
    quantity++;
  }

  void decrement() {
    quantity--;
  }
}
