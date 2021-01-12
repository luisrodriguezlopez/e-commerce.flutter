import 'package:cazanovaApp/Components/itemProduct.dart';
import 'package:cazanovaApp/Components/pageView.dart';
import 'package:flutter/material.dart';

class ProductListContainer extends StatelessWidget {
  const ProductListContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListProducts(),
    );
  }
}

final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F'];
final List<int> colorCodes = <int>[50, 100, 200, 300, 400, 500, 600, 700];

class ListProducts extends StatelessWidget {
  const ListProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: <Widget>[
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: CarrouselView(),
            padding: EdgeInsets.only(bottom: 10),
          );
        },
        childCount: 1,
      )),
      SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              // color: Colors.yellow[colorCodes[index]],
              padding: EdgeInsets.all(8),
              child: ItemProduct(),
            );
          }, childCount: entries.length + 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7))
    ]);
  }
}
