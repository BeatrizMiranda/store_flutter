import 'package:flutter/material.dart';
import 'package:store/mockup/store_products.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key key,
    @required this.product,
    @required this.onAddToCart,
  }) : super(key: key);
  final StoreProduct product;
  final VoidCallback onAddToCart;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String heroTag = '';

  void _addToCart(BuildContext context) {
    setState(() {
      heroTag = '_details';
    });

    widget.onAddToCart();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: 'list_${widget.product.name}$heroTag',
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      widget.product.weight,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text(
                          "\$${widget.product.price}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      "About the product",
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 15),
                    Text(
                      widget.product.description,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 15, 30, 30),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      elevation: 0,
                      padding: EdgeInsets.all(5),
                      primary: Colors.grey[350],
                    ),
                    onPressed: () => {},
                    child: IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () => null,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  flex: 5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      elevation: 2,
                      padding: EdgeInsets.all(5),
                      primary: Color(0xFFF4C459),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    onPressed: () => _addToCart(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
