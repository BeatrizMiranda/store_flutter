import 'package:flutter/material.dart';
import 'package:store/mockup/store_products.dart';

enum StoreState { normal, details, cart }

class StoreBlock with ChangeNotifier {
  StoreState storeState = StoreState.normal;
  List<StoreProduct> catalog = List.unmodifiable(storeProducts);

  void changeToNormal() {
    storeState = StoreState.normal;
    notifyListeners();
  }

  void changeToCart() {
    storeState = StoreState.cart;
    notifyListeners();
  }
}
