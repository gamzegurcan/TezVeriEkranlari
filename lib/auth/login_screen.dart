import 'package:flutter/material.dart';
import 'package:flutter_firebase_get/models/rounded_button.dart';
import 'package:flutter_firebase_get/models/constants.dart';
import 'package:flutter_firebase_get/screens/CategoriesPage.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var refKategoriler = FirebaseDatabase.instance.reference().child("Kategori");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo ',
              child: Container(
                height: 100.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 17.0,
            ),
            RoundedButton(
              title: 'LOGIN',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoriesPage(
                              refKategoriler: refKategoriler,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
