import 'package:flutter/material.dart';
import 'package:store/components/store/store_provider.dart';

class StoreCart extends StatefulWidget {
  StoreCart({Key key}) : super(key: key);

  @override
  _StoreCartState createState() => _StoreCartState();
}

class _StoreCartState extends State<StoreCart> {
  @override
  Widget build(BuildContext context) {
    final block = StoreProvider.of(context).block;

    return Padding(
      padding: EdgeInsets.only(bottom: 30, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Cart",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: block.cart.length,
                    itemBuilder: (context, index) {
                      final item = block.cart[index];
                      final itemTotal = (item.product.price * item.quantity)
                          .toStringAsFixed(2);
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                item.product.image,
                              ),
                            ),
                            SizedBox(width: 15),
                            Text('${item.quantity.toString()} x',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 15),
                            Text('${item.product.name}',
                                style: TextStyle(color: Colors.white)),
                            Spacer(),
                            Text('R\$$itemTotal',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            IconButton(
                                icon:
                                    Icon(Icons.delete, color: Colors.red[300]),
                                onPressed: () {
                                  block.deleteProduct(item);
                                })
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 22, top: 22),
            child: Row(
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  "R\$${block.totalPriceInCart()}",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
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
                'Next',
                style: TextStyle(color: Colors.black),
              ),
            ),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}
