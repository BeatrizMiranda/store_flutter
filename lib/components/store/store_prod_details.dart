import 'package:flutter/material.dart';
import 'package:store/mockup/store_products.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key key, @required this.product}) : super(key: key);

  final StoreProduct product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Hero(
          tag: 'list_${product.name}',
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
