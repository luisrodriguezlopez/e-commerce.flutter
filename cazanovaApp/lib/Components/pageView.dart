import 'package:flutter/material.dart';

class CarrouselView extends StatelessWidget {
  const CarrouselView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Sliders(),
    );
  }
}

class Sliders extends StatelessWidget {
  const Sliders({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        color: Colors.brown,
        child: ListView(
            scrollDirection: Axis.horizontal,
            physics: PageScrollPhysics(), // this is what you are looking for
            children: [
              Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 2,
                  height: 150,
                  color: Colors.yellow,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 2,
                  height: 150,
                  color: Colors.pink,
                )
              ]),
            ]));
  }
}
