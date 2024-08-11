import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget Aboutus()
{String s='''Television is one of the many wonders of modern science and technology. It was invented in England by 
the Scottish scientist J.N. Baird in 1928 and the British Broadcasting Corporation was the first to broadcast television
 images in 1929. Previously the radio helped us hear things from far and near. spread information and knowledge from one corner
  of the globe to another. But all this was done through sound only. But television combined visual images with sound. Today we
   can watch games, shows, and song and dance programs from all corners of the world while sitting in our own homes.
TV can be used for educating the masses, fo habit of watching TV has an adverse effect on the study habits of the young. When we
 read books, we have to use our intelligence and imagination. But in most cases, TV watching is a passive thing. It may dull our
  imagination and intelligence.
''';
  return Container(
    padding:EdgeInsets.all(20),
    child:Card(
    
    elevation:20,
    shadowColor: Colors.red,
    color: Colors.black,
    child:Column(children:[Center(child:Text("About us",style:GoogleFonts.lavishlyYours(textStyle: TextStyle(fontSize: 40.0,color: Colors.black)))),
    SizedBox(height:10.0),
    Center(child:SingleChildScrollView(
      child:Text(s,
      style:GoogleFonts.lavishlyYours(textStyle: TextStyle(fontSize: 40,color: Colors.white)),
      

      )
    )
  )
  ])));

}