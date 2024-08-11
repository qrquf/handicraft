import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ecommerce/OnlineShopping/LoginPage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginPage(x:0))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Colors.blue.shade800,
            Colors.white70,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
        ),
      ),
      child: FlutterLogo(
          size: MediaQuery.of(context).size.height,
      ),
    );
  }
}
