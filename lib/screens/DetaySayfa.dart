import 'package:flutter_firebase_get/model/yemek.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rating_bar/rating_bar.dart';

// ignore: must_be_immutable
class DetaySayfa extends StatefulWidget {
  Yemekler yemek;

  DetaySayfa({this.yemek});

  @override
  _DetaySayfaState createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var refYemekler = FirebaseDatabase.instance.reference().child("Yemekler");
  double _rating;
  final name = "star_rate";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(widget.yemek.Yemek_adi),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Image.network(
                    widget.yemek.resim,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hazırlama Süresi: ${widget.yemek.Suresi}" + "dk"),
                      Row(
                        children: [
                          starButton(context),
                          Text(
                            ' ${widget.yemek.star_rate}.0 / 5.0',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      )
                    ]),
                SizedBox(
                  height: 10,
                ),
                TextS(
                  name: "MALZEMELER",
                ),
                Text(
                  widget.yemek.Malzemesi,
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                TextS(
                  name: "TARİFİ",
                ),
                Text(widget.yemek.Tarif),
                SizedBox(
                  height: 10,
                ),
                TextS(
                  name: "ÖNERİLER",
                ),
                SizedBox(
                    height: 15.0,
                    width: 100.0,
                    child: Divider(
                      color: Colors.orange,
                      thickness: 1,
                    )),
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
    );
  }

  IconButton starButton(BuildContext context) {
    return IconButton(
        icon: Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Hello,Rate Us"),
                  actions: [
                    RatingBar(
                      onRatingChanged: (rating) =>
                          setState(() => _rating = rating),
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      halfFilledIcon: Icons.star_half,
                      isHalfAllowed: false,
                      filledColor: Colors.yellow,
                      emptyColor: Colors.grey,
                      halfFilledColor: Colors.amberAccent,
                      size: 48,
                    ),
                    SizedBox(height: 32),
                    Text(
                      'Rating : $_rating',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    TextButton(
                        onPressed: () {
                          refYemekler
                              .child(widget.yemek.star_rate)
                              .push()
                              .child(widget.yemek.star_rate)
                              .set(_rating)
                              .asStream();
                        },
                        child: Text("Finish"))
                  ],
                );
              });
        });
  }
}

class TextS extends StatelessWidget {
  final String name;
  const TextS({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      height: 20,
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
