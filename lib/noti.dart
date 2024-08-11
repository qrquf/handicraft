import 'package:flutter/material.dart';
class Notify extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title:Text("Notifications"),


        
      ),
      body: Container(
child:Column(
  children: [
    for(int i=0;i<10;i++)Card(
      elevation: 10,
      child:Text("siddharth srivastava"),
      
    )
  ],
)
      ),
    )
   );
  }
  
}