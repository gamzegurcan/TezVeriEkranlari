import 'package:flutter/material.dart';
import 'package:flutter_firebase_get/model/Kategoriler.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.kategori,
  }) : super(key: key);

  final Kategori kategori;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.network(
              "https://cdn.ntvspor.net/5a28979268064f76a8cef3c21f0d3860.jpg?&mode=crop&w=940&h=626.6666666666666",
              height: 130.0,
              width: 200.0,
            ),
          ),
          Text(
            kategori.kategori_ad,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
