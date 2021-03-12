import 'package:flutter_firebase_get/api/yemek.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetaySayfa extends StatefulWidget {
  Yemekler yemek;

  DetaySayfa({this.yemek});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek.Yemek_adi),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(widget.yemek.resim);
            },
          ),
        ),
      ),
    );
  }
}
