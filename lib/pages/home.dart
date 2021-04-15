import 'package:flutter/material.dart';
import 'package:store/components/store/store_block.dart';
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
      return -cartBarHeight;
    } else if (state == StoreState.cart) {
      return -(size.height - kToolbarHeight - cartBarHeight / 2);
    }

    return 0.0;
  }

  double _getTopForBlackPanel(StoreState state, Size size) {
    if (state == StoreState.normal) {
      return size.height - kToolbarHeight - cartBarHeight;
    } else if (state == StoreState.cart) {
      return cartBarHeight / 2;
    }

    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StoreProvider(
      block: block,
      child: AnimatedBuilder(
        animation: block,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                _AppBarGrocery(),
                Expanded(
                  child: Stack(
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
                        top: _getTopForBlackPanel(block.storeState, size),
                        height: size.height,
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
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
            onPressed: () => null,
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
