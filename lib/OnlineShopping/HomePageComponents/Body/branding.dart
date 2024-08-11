import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/HamburgerMenu.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/Body/Brands.dart';
class Branding extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home:Scaffold(appBar: AppBar(
      title:Text("Brand Collaboration")
    ),
      drawer: HamburgerMenu(),
      body:Column(
        children: [
          Text(
            "Our Famous Brands Collaboration ",style:GoogleFonts.lavishlyYours(textStyle: TextStyle(fontSize: 23))
          ),
          SizedBox(height:20),
          Container(child:Brands())
        
        ],
      )
    )
   );
  }
}
