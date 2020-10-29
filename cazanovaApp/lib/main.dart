import 'dart:ui';

import 'package:flutter/material.dart';
import 'Components/pageView.dart';

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
      CarrouselView(),
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
        title: const Text('CazanovaApp'),
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
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Container(
              width: width - 32,
              // color: Colors.blue,
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      this.onTapTapped(0);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor:
                          this.index == 0 ? Colors.white : Colors.blue[100],
                      child: Icon(Icons.home),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapTapped(1);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor:
                          this.index == 1 ? Colors.white : Colors.blue[100],
                      child: Icon(Icons.home),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapTapped(2);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor:
                          this.index == 2 ? Colors.white : Colors.blue[100],
                      child: Icon(Icons.home),
                    ),
                  ),
                ],
              )),
        ));
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
