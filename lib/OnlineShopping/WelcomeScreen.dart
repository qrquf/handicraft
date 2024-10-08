import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ecommerce/OnlineShopping/LoginPage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 0.5;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Start animation after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });

    // Navigate to the login page after a delay of 3 seconds
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage(x: 0)),
      ),
    );
  }

  void _startAnimation() {
    setState(() {
      _opacity = 1.0;
      _scale = 1.0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _opacity,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Text(
                'Handy',
                style: TextStyle(
                  fontSize: 60, // Adjust the font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Cursive', // Use a custom font if needed
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
