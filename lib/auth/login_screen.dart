import 'package:flutter/material.dart';
import 'package:flutter_firebase_get/screens/categories_full.dart';
import 'package:flutter_firebase_get/widgets/background_image.dart';
import 'package:flutter_firebase_get/widgets/rounded_button.dart';
import 'package:flutter_firebase_get/widgets/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_firebase_get/screens/CategoriesPage.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _auth = FirebaseAuth.instance;

  var refKategoriler = FirebaseDatabase.instance.reference().child("Kategori");
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          backgroundimage(screenSize: screenSize),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Logo koymak istenirse diye bıraktım.
                Hero(
                  tag: 'logo ',
                  child: Container(
                    height: 100.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 17.0,
                ),
                RoundedButton(
                  title: 'GİRİŞ',
                  colour: Colors.lightBlueAccent,
                  onPressed: () async {
                    try {
                      final user = (await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password))
                          .user;
                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriesFull(
                                      refKategoriler: refKategoriler,
                                    )));
                      }
                    } catch (e) {
                      print(e);
                      email = "";
                      password = "";
                    }
                  },
                  /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoriesPage(
                                  refKategoriler: refKategoriler,
                                )));*/
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
