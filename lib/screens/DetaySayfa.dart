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
              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Image.network(
                        widget.yemek.resim,
                      ),
                    ),
                    Text("Hazırlama Süresi: ${widget.yemek.Suresi}" + "dk"),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        "MALZEMELER:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      height: 20,
                    ),
                    Text(widget.yemek.Malzemesi),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        "TARİFİ:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      height: 20,
                    ),
                    Text(widget.yemek.Tarif),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Text(
                        "ÖNERİLER:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 16.0),
                          denemecard(),
                          SizedBox(width: 16.0),
                          denemecard(),
                          SizedBox(width: 16.0),
                          denemecard(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class denemecard extends StatelessWidget {
  const denemecard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(1),
            height: 100,
            width: 120,
            child: Image.network(
              "https://cdn.yemek.com/mnresize/940/940/uploads/2015/01/hamburger-yeni.jpg",
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
