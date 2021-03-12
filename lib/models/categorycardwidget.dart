import 'package:flutter/material.dart';
import 'package:flutter_firebase_get/api/Kategoriler.dart';



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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: SizedBox(
              height: 50.0,
            ),
          ),
          Text(
            kategori.kategori_ad,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}