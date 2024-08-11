import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Checkout extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child:Column(
            children:[
              Text("Details About the Seller -"),
               Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.limeAccent, Color.fromARGB(255, 2, 2, 2), Colors.greenAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage("siddharth.jpg")),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Stack(
                      children: [
                        Text(
                          "Siddharth Srivastava",
                          style: GoogleFonts.creepster(
                            textStyle: TextStyle(
                              fontSize: 45,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color = Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          "Siddharth Srivastava",
                          style: GoogleFonts.creepster(
                            textStyle: const TextStyle(
                              fontSize: 45,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "siddharthsrivastava117@gmail.com",
                      style: GoogleFonts.vampiroOne(
                          textStyle:
                              TextStyle(fontSize: 19, color: Colors.white)),
                    ),
                    Stack(
                      children: [
                        Text(
                          "6394994875",
                          style: GoogleFonts.nosifer(
                            textStyle: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 5
                                ..color = Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          "6394994875",
                          style: GoogleFonts.nosifer(
                            textStyle: const TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

            ]
          )
        )
      )
      
    ]))));
  }

}