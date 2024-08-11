//import 'dart:html';
//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/OnlineShopping/HomePageComponents/AppBar/HamburgerMenu.dart';
class ProdDetails extends StatelessWidget{
  
 @override 
 Widget build(BuildContext context)
 {final color=[Colors.white,Colors.black,Colors.blue,
   Colors.yellow,
   Colors.green,
   Colors.pink,
   Colors.yellow,
   Colors.orange,
   Colors.red,
   Colors.amber,
   Colors.grey,
   ];
  return MaterialApp(
    home: Scaffold(
      appBar:AppBar(
      leading: IconButton(onPressed:() {Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color:Colors.white),),
      title:Text("add product ",style:TextStyle(fontSize: 16)),
      actions:[
        TextButton(onPressed: () {},child:Text("save",style:TextStyle(color:Colors.purple)))
      ]
    ), 
      drawer:HamburgerMenu(),
      body:Padding(
        padding: EdgeInsets.all(20),
        child:SingleChildScrollView(
          child:Column(
            children:[
              Image.asset("sasha.jpeg",height:200,width:double.infinity),
              SizedBox(height:10),
              Text("Product name"),
              SizedBox(height:10),
              Center(child:Text("this Product rating")),
              SizedBox(height:10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0;i<5;i++) Icon(Icons.star,color:Colors.yellow)
                ],
              ),
              SizedBox(height:10),
              Center(child:Text("Price - \$500",style:TextStyle(color: Colors.red))),
              SizedBox(height:10),
              Center(child:Text("Available colors",style: TextStyle(fontSize: 25)))
              ,
              Center(child:Wrap(
                    spacing: 4.0,
                    runSpacing: 10.0,
                    children: [
                    for(int i=0;i<6;i++) InkWell(
                      child:Stack(children:[Container(
                        decoration: BoxDecoration(
                          color: color[i],
                          borderRadius:BorderRadius.circular(100),

                        ),
                        height:100,
                        width:100
                      ),
                      
                    ])

                      )
            ]
          )
        ),
        SizedBox(height:20),
        Text("Description"),
        Column(
          children:[
        Card(child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text("Company name:"),
            Text("xyz"),

        
          ],
          ),
          elevation:20
                        ),
                        SizedBox(height:10),
                         Card(child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text("brand name:"),
            Text("mno"),

        
          ],
          ),
          elevation:20
                        ),SizedBox(height:10),
                        Card(child:Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text("Category"),
            Text("        Cubism"),

        
          ],
          ),
          elevation:20
                        ),

                         SizedBox(height:20),
        Row(
          children:[
            Center(child:Text("additional Detatails-",style:GoogleFonts.lavishlyYours(textStyle: TextStyle(fontSize: 20)))),

          ]
        )])

      ])
    ),
  )));
 } 
}