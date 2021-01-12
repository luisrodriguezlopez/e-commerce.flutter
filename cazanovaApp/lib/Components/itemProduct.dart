import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2 - 16;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 8, 16),
              child: Image.network(
                'https://http2.mlstatic.com/perfume-caballero-bentley-for-men-intense-100-ml-edp-origina-D_NQ_NP_977104-MLM40956491100_022020-F.jpg',
                width: width - 30,
              )),
          Container(
              width: width - 32,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        "Perfume Caballero Bentley For Men Intense 100 Ml Edp Origina",
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Roboto-Medium',
                            color: Colors.grey) // fontWeight: FontWeight.w500),
                        ),
                    Text(
                      '\$1,000',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Roboto-Black',
                          // fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ])
              // crossAxisAlignment: CrossAxisAlignment.start,
              ),
        ],
      ),
    );
  }
}
