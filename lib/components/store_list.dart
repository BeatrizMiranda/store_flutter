import 'package:flutter/material.dart';
import 'package:store/components/store_provider.dart';

class StoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final block = StoreProvider.of(context).block;

    return StaggeredDualView(
      itemBuilder: (context, index) {
        final product = block.catalog[index];
        return Card(
          child: Column(
            children: [
              Image.asset(product.image, fit: BoxFit.cover, height: 100),
            ],
          ),
        );
      },
      itemCount: block.catalog.length,
    );
    // return ListView.builder(
    //   padding: EdgeInsets.only(top: cartBarHeight),
    //   itemCount: block.catalog.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       height: 100,
    //       width: 100,
    //       color: Colors.primaries[index % Colors.primaries.length],
    //     );
    //   },
    // );
  }
}
