import 'package:flutter/material.dart';
import 'package:store/components/StaggeredDualView.dart';
import 'package:store/components/store/store_prod_details.dart';
import 'package:store/components/store/store_provider.dart';
import 'package:store/pages/Home.dart';

class StoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final block = StoreProvider.of(context).block;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.fromLTRB(15, cartBarHeight + statusBarHeight, 15, 0),
      color: backgroundColor,
      child: StaggeredDualView(
        offserPercent: 0.2,
        aspectRadio: 0.7,
        itemBuilder: (context, index) {
          final product = block.catalog[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 700),
                  pageBuilder: (context, animation, __) {
                    return FadeTransition(
                      opacity: animation,
                      child: ProductDetails(
                          product: product,
                          onAddToCart: () {
                            block.addProduct(product);
                          }),
                    );
                  },
                ),
              );
            },
            child: Card(
              elevation: 8,
              shadowColor: Colors.black45,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'list_${product.name}',
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      product.weight,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: block.catalog.length,
      ),
    );
  }
}
