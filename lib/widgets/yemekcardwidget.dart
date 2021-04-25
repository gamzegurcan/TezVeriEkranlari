import 'package:flutter/material.dart';
import 'package:flutter_firebase_get/model/yemek.dart';


class YemekCardWidget extends StatelessWidget {
  const YemekCardWidget({
    Key key,
    @required this.yemek,
  }) : super(key: key);

  final Yemekler yemek;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Image.network(
              yemek.resim,
              height: 120.0,
              width: 200.0,
            ),
          ),
          Text(
            yemek.Yemek_adi,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}