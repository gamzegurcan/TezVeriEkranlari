import 'package:flutter_firebase_get/screens/DetaySayfa.dart';
import 'package:flutter_firebase_get/model/Kategoriler.dart';
import 'package:flutter_firebase_get/model/yemek.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_get/widgets/yemekcardwidget.dart';

class YemeklerSayfa extends StatefulWidget {
  Kategori kategori;
  bool searchState = false;
  YemeklerSayfa({this.kategori, this.searchState});

  @override
  _YemeklerSayfaState createState() => _YemeklerSayfaState();
}

class _YemeklerSayfaState extends State<YemeklerSayfa> {
  var refYemekler = FirebaseDatabase.instance.reference().child("Yemekler");
  bool searchState = false;
  String searchWord = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchState
            ? TextField(
                decoration: InputDecoration(
                  hintText: "Search Something..",
                  hintStyle: TextStyle(color: Colors.white),
                ),
                onChanged: (resultSearch) {
                  print("Sonuc : $resultSearch");
                  setState(() {
                    searchWord = resultSearch;
                  });
                },
              )
            : Text("Kategori : ${widget.kategori.kategori_ad}"),
        actions: [
          searchState
              ? IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      searchState = false;
                      searchWord = "";
                    });
                  })
              : IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      searchState = true;
                    });
                  }),
        ],
      ),
      body: StreamBuilder<Event>(
        stream: refYemekler
            .orderByChild("kategori_ad")
            .equalTo(widget.kategori.kategori_ad)
            .onValue,
        builder: (context, event) {
          if (event.hasData) {
            var YemeklerSayfaListesi = <Yemekler>[];

            var gelenDegerler = event.data.snapshot.value;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenYemek = Yemekler.fromJson(key, nesne);
                if (searchState) {
                  if (gelenYemek.Malzemesi.contains(searchWord) |
                      gelenYemek.Yemek_adi.contains(searchWord)) {
                    YemeklerSayfaListesi.add(gelenYemek);
                  }
                } else {
                  YemeklerSayfaListesi.add(gelenYemek);
                }
              });
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 2,
              ),
              itemCount: YemeklerSayfaListesi.length,
              itemBuilder: (context, indeks) {
                var yemek = YemeklerSayfaListesi[indeks];
                return Flexible(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetaySayfa(
                                    yemek: yemek,
                                  )));
                    },
                    child: YemekCardWidget(yemek: yemek),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
