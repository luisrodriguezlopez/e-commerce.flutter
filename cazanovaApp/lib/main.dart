import 'dart:ui';

import 'package:cazanovaApp/Components/productList.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      ProductListContainer(),
      PlaceholderWidget(Colors.deepOrange),
      PlaceholderWidget(Colors.green)
    ];

    void _onTapTapped(int index) {
      print(index);
      // if (index == 0) {
      setState(() {
        this._currentIndex = index;
        print(index);
      });
      // }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CazanovaApp',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.shopping_bag,
          color: Colors.black,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search, color: Colors.black))
        ],
      ),
      body: Container(child: _children[this._currentIndex]),
      extendBody: true,
      bottomNavigationBar: BounceTabBar(
        onTapTapped: _onTapTapped,
        index: _currentIndex,
      ),
    );
  }
}

class BounceTabBar extends StatelessWidget {
  final Function(int) onTapTapped;
  final int index;
  BounceTabBar({@required this.index, @required this.onTapTapped});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width - 32,
        height: kBottomNavigationBarHeight,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
              width: width - 32,
              height: kBottomNavigationBarHeight,
              // color: Colors.blue,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          this.onTapTapped(0);
                        },
                        child: Icon(Icons.home),
                      )),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        onTapTapped(1);
                      },
                      child: Icon(Icons.favorite),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        onTapTapped(2);
                      },
                      child: Icon(Icons.menu),
                    ),
                  ),
                ],
              )),
        )));
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
