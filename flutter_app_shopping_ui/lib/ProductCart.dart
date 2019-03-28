import 'package:flutter/material.dart';

import 'CustomIcons.dart';

class ProductCart extends StatelessWidget {
  int cardColor;
  String imgUrl;
  String title;
  String previousPrice;
  String price;

  ProductCart(
      this.cardColor, this.imgUrl, this.title, this.previousPrice, this.price);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      width: double.infinity,
      height: 320.0,
      decoration: BoxDecoration(
          color: Color(cardColor),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
      child: Column(
        children: <Widget>[
          Image.asset(
            imgUrl,
            width: 281.0,
            height: 191.0,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 25.0, fontFamily: "Raleway"),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(CustomIcons.favorite), onPressed: () {}),
                Column(
                  children: <Widget>[
                    Text(previousPrice,
                        style: TextStyle(
                            color: Color(0xFFfeb0ba),
                            fontSize: 15.0,
                            fontFamily: "Helvetica")),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(price,
                        style:
                            TextStyle(fontSize: 28.0, fontFamily: "Helvetica")),
                  ],
                ),
                IconButton(icon: Icon(CustomIcons.cart), onPressed: () {})
              ],
            ),
          )
        ],
      ),
    );
  }
}
