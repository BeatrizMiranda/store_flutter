import 'package:flutter/material.dart';
import 'package:store/components/store/store_block.dart';
import 'package:store/components/store/store_cart.dart';
import 'package:store/components/store/store_list.dart';
import 'package:store/components/store/store_provider.dart';

const cartBarHeight = 100.0;
const backgroundColor = Color(0XFFF6F5F2);
const _panelTransition = Duration(milliseconds: 500);

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final block = StoreBlock();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta < -7) {
      block.changeToCart();
    } else if (details.primaryDelta > 12) {
      block.changeToNormal();
    }
  }

  double _getTopForWhitePanel(StoreState state, Size size) {
    if (state == StoreState.normal) {
      return -cartBarHeight + kToolbarHeight;
    } else if (state == StoreState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }

    return 0.0;
  }

  double _getTopForBlackPanel(StoreState state, Size size) {
    if (state == StoreState.normal) {
      return size.height - cartBarHeight;
    } else if (state == StoreState.cart) {
      return cartBarHeight / 2;
    }

    return 0.0;
  }

  double _getTopForAppBar(StoreState state, double statusBarHeight) {
    if (state == StoreState.normal) {
      return statusBarHeight;
    } else if (state == StoreState.cart) {
      return -cartBarHeight;
    }

    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;
    return StoreProvider(
      block: block,
      child: AnimatedBuilder(
        animation: block,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                AnimatedPositioned(
                  duration: _panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: _getTopForWhitePanel(block.storeState, size),
                  height: size.height - kToolbarHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: StoreList(),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: _panelTransition,
                  curve: Curves.decelerate,
                  left: 0,
                  right: 0,
                  top: _getTopForBlackPanel(block.storeState, size) + 15,
                  height: size.height - kToolbarHeight,
                  child: GestureDetector(
                    onVerticalDragUpdate: _onVerticalGesture,
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 25),
                            child: AnimatedSwitcher(
                              duration: _panelTransition,
                              child: SizedBox(
                                height: 30,
                                child: block.storeState == StoreState.normal
                                    ? Row(
                                        children: [
                                          Text(
                                            'Cart',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.0),
                                                child: Row(
                                                  children: List.generate(
                                                    block.cart.length,
                                                    (index) => Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.0),
                                                      child: Stack(children: [
                                                        Hero(
                                                          tag:
                                                              'list_${block.cart[index].product.name}_details',
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Colors.white,
                                                            backgroundImage:
                                                                AssetImage(
                                                              block
                                                                  .cart[index]
                                                                  .product
                                                                  .image,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          right: 0,
                                                          child: CircleAvatar(
                                                            radius: 10,
                                                            backgroundColor:
                                                                Colors.red,
                                                            child: Text(
                                                              block.cart[index]
                                                                  .quantity
                                                                  .toString(),
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Color(0xFFF4C459),
                                            child: Text(
                                              block.totalItemsCart().toString(),
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ),
                          ),
                          Expanded(child: StoreCart())
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  left: 0,
                  right: 0,
                  curve: Curves.decelerate,
                  duration: _panelTransition,
                  top: _getTopForAppBar(block.storeState, statusBarHeight),
                  child: _AppBarGrocery(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: backgroundColor,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Fruits and vegetables',
              style: TextStyle(color: Colors.black),
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => null,
          )
        ],
      ),
    );
  }
}
