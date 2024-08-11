import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import'dart:async';

import 'package:ecommerce/OnlineShopping/LoginPage.dart';
class yourapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Handy());
  }
}

class Handy extends StatefulWidget {
  const Handy({Key? key}) : super(key: key);
  @override
  State<Handy> createState() => Zzz();
}

class Zzz extends State<Handy> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage(x:0))));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              padding: EdgeInsets.all(15),
              color: Colors.black,
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    //border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple,
                        blurRadius: 15,
                        //spreadRadius: 40,
                        //blurStyle: BlurStyle.normal,
                      ),
                      BoxShadow(
                        color: Colors.pink,
                        blurRadius: 16,
                        //spreadRadius: -1,
                      ) //blurStyle: BlurStyle.normal)
                    ],
                  ),
                  child: Center(
                      child: Text(
                    "Handy",
                    style:GoogleFonts.lavishlyYours( textStyle:const TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(color: Colors.purple, blurRadius: 15),
                          Shadow(color: Colors.pink, blurRadius: 16)
                        ])),
                  ))),
            )));
  }
}
