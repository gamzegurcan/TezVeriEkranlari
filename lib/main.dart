import 'package:flutter_firebase_get/screen/YemeklerSayfa.dart';
import 'package:flutter_firebase_get/api/Kategoriler.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_get/models/categorycardwidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var refKategoriler = FirebaseDatabase.instance.reference().child("Kategori");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Kategoriler")),
      ),
      body: StreamBuilder<Event>(
        stream: refKategoriler.onValue,
        builder: (context, event) {
          if (event.hasData) {
            var kategoriListesi = <Kategori>[];

            var gelenDegerler = event.data.snapshot.value;

            if (gelenDegerler != null) {
              gelenDegerler.forEach((key, nesne) {
                var gelenKategori = Kategori.fromJson(key, nesne);
                kategoriListesi.add(gelenKategori);
              });
            }

            return ListView.builder(
              itemCount: kategoriListesi.length,
              itemBuilder: (context, indeks) {
                var kategori = kategoriListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YemeklerSayfa(
                                  kategori: kategori,
                                )));
                  },
                  child: CategoryCard(kategori: kategori),
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
