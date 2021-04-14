import 'package:flutter/material.dart';
import 'package:store/components/store_block.dart';

class StoreProvider extends InheritedWidget {
  final StoreBlock block;
  final Widget child;

  StoreProvider({
    @required this.block,
    @required this.child,
  }) : super(child: child);

  static StoreProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<StoreProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
